public with sharing class ExampleOfDML {
    public ExampleOfDML() {
        try 
        {   
        List<Contact> updatedList = new List<Contact>();
        List<Contact> conList = [Select Department , Description from Contact];
            for(Contact con : conList) {
                if (con.Department == 'Finance') {
                    con.Description = 'New description';
                    // Add updated contact sObject to the list.
                    updatedList.add(con);
                    update updatedList;
                    system.debug(con);
                }
            }
        }
        catch(Exception e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
}