public with sharing class ExampleOfDML {
    public ExampleOfDML() {
        try 
        {   
        List<Contact> conList = [Select Department , Description from Contact];
            for(Contact con : conList) {
                if (con.Department == 'Finance') {
                    con.Description = 'New description';
                    // Add updated contact sObject to the list.
                    system.debug(con);
                }
            }
            update conList;
        }
        catch(Exception e)
        {
            system.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
}