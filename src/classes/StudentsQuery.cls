public class StudentsQuery {
    public StudentsQuery(){
 Student_Record__c student=[SELECT id,Name,Roll_Number__c,Mobile_Number__c,Father_s_Name__c FROM Student_Record__c ORDER BY createdDate DESC LIMIT 1 ];
 System.Debug ('Check Latest Record'+ student );
}
}