public with sharing class AggregrateQueries {
    public AggregrateQueries() {
        List<AggregateResult> stateDetails = [Select Country__c, COUNT(Name) Total_Number_Of_States from State__c Group By Country__c];
        if (stateDetails.size() > 0)
        {
            Map<ID,Country__c> a = new Map<ID,Country__c>();
        for (AggregateResult state : stateDetails) 
        {
            Country__c cont = new Country__c();
            cont.ID = (ID)state.get('Country__c');
            cont.Total_Number_Of_States__c = (Decimal)state.get('Total_Number_Of_States');
            a.put(cont.ID,cont);
        }
        if(a != null) {
        update a.values();
        }
        }

        List<AggregateResult> districtDetails = [Select State__c, COUNT(Name) Total_Number_Of_Districts from District__c Group By State__c];
        if (districtDetails.size() > 0)
        {
        Map<ID,State__c> d = new Map<ID,State__c>();
        for (AggregateResult district : districtDetails) 
        {
            State__c s = new State__c();
            s.ID = (ID)district.get('State__c');
            s.Total_Number_of_Districts__c = (Decimal)district.get('Total_Number_Of_Districts');
            d.put(s.ID,s);
        }
        if(d != null) {
        update d.values();
        }
        }


        List<AggregateResult> countryDetails = [Select Country__c, sum(Total_Number_Of_Districts__c) Total_Number_Of_Districts fROM State__c Group By Country__c];
        if (countryDetails .size() > 0)
        {
        Map<ID,Country__c> x = new Map<ID,Country__c>();
        for (AggregateResult countryList : countryDetails) 
        {
            Country__c dis = new Country__c();
            dis.ID = (ID)countryList.get('Country__c');
            dis.Total_Number_of_Districts__c = (Decimal)countryList.get('Total_Number_Of_Districts');
            x.put(dis.ID,dis);
        }
        if(x != null) {
        update x.values();
        }
        }
    }
}