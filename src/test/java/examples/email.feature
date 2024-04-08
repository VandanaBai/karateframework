Feature: get email

  @ignore
  Scenario: get email
  
	* def randomdata = '';
    * def a =
      """
      function randommail() {
      	var chars = 'ABCDEFabcdefghijklms';
      
      
      	for(i=0; i<= 6; i++) { 
      	  randomdata += chars.charAt(Math.floor(Math.random() * chars.length()));
      		}
            	var data = randomdata + '@gmail.co';	
      	return data;
      }
      """
     * def mailf = a()
     * print mailf
