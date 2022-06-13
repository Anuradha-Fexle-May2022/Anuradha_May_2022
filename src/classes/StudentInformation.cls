public class StudentInformation {
    public static void studentInformation(){
        //Teacher Layout,Registrar Layout//
        //Student Personal Info//
        Student_Record__c student = new Student_Record__c();
        student.Name__c = 'Anuradha Malpani';
        student.First_Name__c = 'Anuradha';
        student.Last_Name__c = 'Malpani';
		student.Father_s_Name__c = 'Ramesh Malpani';
        student.Father_s_Mobile_Number__c = '8283719223';
        student.Occupation__c = 'Business';
		student.Mothers_Name__c = 'Mrs.Meena Malpani';
		student.Roll_Number__c=45;
        student.Female__c = True;
        student.Male__c = False;
        student.Home_Phone__c = '7976695057';
        student.Emergency_Contact_Number__c = '782639291';
        student.Email__c = 'anu.malpani@gmail.com';
        student.Address__c = 'Bajaj Road';
        student.Overall_Percentage__c = 98;
        student.Address__c = 'Bajaj Road';
        student.GitHub_ID__c = 'Anuradha Malpani';
        
        //Class Info//
		student.Stream__c = 'Science';
        student.Class__c = '12';
        student.Section__c = 'A';
        
        //Semester Details//
		student.X1st_Semester_Percentage__c = 98;
		student.X2nd_Semester_Percentage__c = 96;
		student.X3rd_Semester_Percentage__c = 91;
		student.X4th_semester_percentage__c = 92;
        student.X1st_Semester_Back__c = False;
        student.X2nd_Semester_back__c = False;
        student.X3rd_Semester_back__c = False;
        student.X4th_Semester_Back__c = False;
        student.Subject_in_which_Back_1_sem__c = 'Maths';
        student.Subject_in_which_Back_2_sem__c = 'Physics';
        student.Subject_in_which_back_3_sem__c = 'AOA';
        student.Subject_in_which_back_4_sem__c = 'DBMS';
        
        //Bank Details//
        student.Account_Number__c = 7938675522L;
		student.Bank_Name__c = 'HDFC Bank';
		student.Bank_Phone_Number__c = 687163;
        student.IFSC_code__c = 'UBIN0876567';
        student.Mobile_Number__c = 243926483;
        student.State__c = 'Rajasthan';
		student.City__c = 'Sikar';
        
        //Fees Details//
		student.Contact_number__c = '729732918';
		student.Current_Semester__c = 5;
		student.Donation_Amount__c = 219816387;
        student.Pending_Fees_Amount__c = 1000;
        student.Pending_Overall_Amount__c = 1500;
        student.Current_Year__c = 3;
        student.Fess_Submitted__c = True;
        student.Pending_Fees_Amount__c = 1000;
        student.Exam_Fees_Submitted__c = True;
        student.Pending_Exam_Fees__c = 500;
		insert student;
 system.debug ('Check Latest Record'+ student );
}
}