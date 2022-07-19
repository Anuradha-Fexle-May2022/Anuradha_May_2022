public with sharing class AggregrateQueries {
    //Do Aggregrate Queries For finding State and District From Country
    public AggregrateQueries() {
        try
        {
        Map<ID,Country__c> mapOfIdForCountry = new Map<ID,Country__c>();
        //In this we can do aggregrate Queries for finding Total Number Of States from Country
        for (AggregateResult state : [Select Country__c, COUNT(Name) Total_Number_Of_States from State__c Group By Country__c]) 
        {
            Country__c cont = new Country__c();
            cont.ID = (ID)state.get('Country__c');
            cont.Total_Number_Of_States__c = (Decimal)state.get('Total_Number_Of_States');
            mapOfIdForCountry.put(cont.ID,cont);
        }
        if(mapOfIdForCountry != null) {
        update mapOfIdForCountry.values();
        }
        }
        catch (DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }

        try
        {
        Map<ID,State__c> mapIdForState = new Map<ID,State__c>();
        //In this we can do Aggregate Queries for finding Total Number Of District from State
        for (AggregateResult district : [Select State__c, COUNT(Name) Total_Number_Of_Districts from District__c Group By State__c]) 
        {
            State__c stat = new State__c();
            stat.ID = (ID)district.get('Country__c');
            stat.Total_Number_of_Districts__c = (Decimal)district.get('Total_Number_Of_Districts');
            mapIdForState.put(stat.ID,stat);
        }
        if(mapIdForState != null) {
        update mapIdForState.values();
        }
        }
        catch (DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }

        try
        {
        Map<ID,Country__c> mapOfCountryWithDistrict = new Map<ID,Country__c>();
        // In this we can do Aggregrate Queries for finding Total Number Of District from Country
        for (AggregateResult countryList : [Select Country__c, sum(Total_Number_Of_Districts__c) Total_Number_Of_Districts fROM State__c Group By Country__c]) 
        {
            Country__c cont = new Country__c();
            cont.ID = (ID)countryList.get('Country__c');
            cont.Total_Number_of_Districts__c = (Decimal)countryList.get('Total_Number_Of_Districts');
            mapOfCountryWithDistrict.put(cont.ID,cont);
        }
        if(mapOfCountryWithDistrict != null) {
        update mapOfCountryWithDistrict.values();
        }
        }
        catch (DmlException e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
}