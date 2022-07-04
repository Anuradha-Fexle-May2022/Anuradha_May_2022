public virtual class SuperClass {
        public String mySalutation;
        public String myFirstName;
        public String myLastName;

    public SuperClass() {
        mySalutation = 'Ms';
        myFirstName = 'Anuradha';
        myLastName = 'Malpani';
    }

    public SuperClass(String salutation, String firstName, String lastName) {
        mySalutation = salutation;
        myFirstName = firstName;
        myLastName = lastName;
    }

    public virtual void printName() {
        system.debug('My name is :' + mySalutation + myLastName);
    }
  
    public virtual String getFirstName() {
        return myFirstName;
    }
    }