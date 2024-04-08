Feature: create post req

  Background: 
    * header Content-Type = 'application/json'
    * header Authorization = 'Bearer ' + token
@ignore
  Scenario: create post req
    Given url baseurl
    * def r =
    """
     {
  "name": "Som ",
  "email": "miieedfCC@gmail.co",
  "gender": "female",
  "status": "inactive"
}
"""
    * def req = read('classpath:methods/reqpayloadpost.json');
  * print req
    And request r
    When method post
   
    Then status 201
    
