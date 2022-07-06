public with sharing class MapWithCountryStateAndDistrict {

        Map<String,Map<String,Map<String,List<String>>>> mapOfCountry = new Map<String,Map<String,Map<String,List<String>>>>();
        public MapWithCountryStateAndDistrict() {

            //Create List of District with State Of India
            List<String> listOfDistrictOfBihar = new List<String>{'Patna','Nalanda','Motihari','Banka'};
            List<String> listOfDistrictOfRajasthan = new List<String>{'Ajmer','Alwar','Bikaner','Rajsamand'};
            List<String> listOfDistrictOfGujarat = new List<String>{'Ahmedabad','Bharuch','Gandhinagar','Gir Somnath'};
            List<String> listOfDistrictofHaryana = new List<String>{'Rohtak','Hissar','Karnal','Ambala'};

            //Create List of District with State Of Belgium
            List<String> listOfDistrictOfAntwerp = new List<String>{'Deurne','Berchem','Ekeren','Hoboken'};
            List<String> listOfDistrictOfLimburg = new List<String>{'Gennep','Venray','Heerlen','Vaals'};
            List<String> listOfDistrictOfBrabantWallon = new List<String>{'Brandenburg','Saxony-Anhalt','Thuringia','Bavaria'};
            List<String> listOfDistrictOfNamur = new List<String>{'Naninne','Wepion','Wierde','Temploux'};

            //Create List of District with State Of China
            List<String> listOfDistrictOfHainan = new List<String>{'Haikou','Longhua','Qiongshan','Meilan'};
            List<String> listOfDistrictOfFujian = new List<String>{'Anqing','Bicheng','Baishan','Siping'};
            List<String> listOfDistrictOfHebei = new List<String>{'Handan','Jinnan','Dongli','Jinghai'};
            List<String> listOfDistrictOfJilin = new List<String>{'Jiaohe','Huli','Jimei','Tongan'};

            //Create List of District with State Of Bangladesh
            List<String> listOfDistrictOfBarisal = new List<String>{'Bakerganj','Muladi','Hijla','Wazirpur'};
            List<String> listOfDistrictOfChittagong = new List<String>{'Chandpur','Feni','Khagrachhari','Lakshmipur'};
            List<String> listOfDistrictOfDhaka = new List<String>{'Dhamrai','Savar','Tongi','Saturia'};
            List<String> listOfDistrictOfKhulna= new List<String>{'Kushtia','Jessore','Narail','Meherpur'};
        
            //Fill the Map Of India
            Map<String,List<String>> mapOfIndia = new Map<String,List<String>> {'Bihar' => listOfDistrictOfBihar,'Rajasthan' => listOfDistrictOfRajasthan,'Gujarat' => listOfDistrictOfGujarat, 'Haryana' => listOfDistrictOfHaryana};

            //Fill the Map Of Belgium
            Map<String,List<String>> mapOfBelgium = new Map<String,List<String>> {'Antwerp' => listOfDistrictOfAntwerp,'Limburg' => listOfDistrictOfLimburg,'BrabantWallon' => listOfDistrictOfBrabantWallon,'Namur' => listOfDistrictOfNamur};
        
            //Fill the Map Of China
            Map<String,List<String>> mapOfChina = new Map<String,List<String>> {'Hainan' => listOfDistrictOfHainan,'Jilin' => listOfDistrictOfJilin,'Hebei' => listOfDistrictOfHebei,'Fujian' => listOfDistrictOfFujian};

            //Fill the Map Of Bangladesh
            Map<String,List<String>> mapOfBangladesh = new Map<String,List<String>> {'Barisal' => listOfDistrictOfBarisal, 'Chittagong' => listOfDistrictOfChittagong, 'Dhaka' => listOfDistrictOfDhaka,'Khulna' => listOfDistrictOfKhulna};
                
            //Fill the Map Of Asia Continent 
            Map<String,Map<String,List<String>>> asiaContinent = new Map<String,Map<String,List<String>>> {'India' => mapOfIndia,'China' => mapOfChina,'Bangladesh' => mapOfBangladesh};
               
            //Fill the Map of Europe Continent
            Map<String,Map<String,List<String>>> europeContinent = new Map<String,Map<String,List<String>>> {'Belgium' => mapOfBelgium};
            
            //Fill the Country Code
            mapOfCountry.put('AS',asiaContinent);
            mapOfCountry.put('EU',europeContinent);
        }

        public void startswithB()
        {
            for(String continentCode : mapOfCountry.keySet())
            { 
                Map<String,Map<String,List<String>>> continentName = mapOfCountry.get(continentCode);
                for(String country : continentName.keySet())
                    {
                       if(country.startsWith('B'))
                        {
                            Map<String,List<String>> stateDistrict = continentName.get(country);
                            
                            for(String states : stateDistrict.keySet())
                            {
                                if(states.startsWith('B'))
                                {
                                    List<String> district = stateDistrict.get(states);

                                    for(String districts : district)
                                    {
                                        if(districts.startsWith('B'))
                                        {
                                            system.debug('Country :' + country);
                                            system.debug('States :' + states);
                                            system.debug('Districts :' + districts);
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
            }

        }

        public void lengthOfDistrict(Integer maxLength)
        {
            for(String continentCode : mapOfCountry.keySet())
            {
                Map<String,Map<String,List<String>>> continentName = mapOfCountry.get(continentCode);
                for(String country : continentName.keySet())   
                {
                        Map<String,List<String>> stateDistrict = continentName.get(country);
                            for(String states : stateDistrict.keySet())
                            {
                                    List<String> district = stateDistrict.get(states);
                                    for(String districts : district)
                                    {
                                        if(districts.length() > maxLength)
                                        {
                                            system.debug('Districts :' + districts);
                                        }
                                    }
                            }
                }
            }
        }
}