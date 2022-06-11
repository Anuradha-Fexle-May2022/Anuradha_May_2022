public class StudentsQuery {
    public StudentsQuery(){
 Student_Record__c student=[Select Id,Name,Roll_Number__c,Mobile_Number__c,Father_s_Name__c from Student_Record__c order by CreatedDate DESC limit 1 ];
 System.debug ('Check Latest Record'+ student );
}
}