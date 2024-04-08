Feature: create post req

  Background: 
  
    * header Content-Type = 'application/json'
    * header Authorization = 'Bearer ' + token
@ignore
  Scenario: create post req
    Given url baseurl
    * def mailid =  call read('classpath:examples/email.feature')
    * def req = read('classpath:payloads/reqpayloadpost.json');
  * print mailid.mailf
   * print req
    And set req.email = mailid.mailf
     And request req
    When method post
    * print response.requestBody
    Then status 201
    And match response.email == mailid.mailf
    * print env
    * System.setProperty("karate.env", response.id);
    * print env
