Feature: create user

  Background: 
    * header Authorization = 'Bearer ' + token
    * header Content-Type = 'application/json'
    * def payload = read('classpath:payloads/reqpayloadpost.json')

  Scenario: Create user
    * def fun =
      """
      function f() {
      var ch = 'ABVDDEEafdcdfed'
      var text = ''
      for(i=0; i< 4; i++){
      text += ch.charAt(Math.floor(Math.random()* ch.length()));
      }
      return text + '@gmail.com'
      }

      """
    * def mail = fun()
    * print mail
    Given url baseurl
    * def b = get payload.email
    * def nm = get payload.name
    * print b
    And set payload.email = mail
    And request payload
    When method post
    Then status 201
    And print responseStatus
   
    And print response
    And match response.email == mail
    And match response == '#object'
    And match response ==
      """
      { 
      "id": '#number',
         "name": '#(nm)',
          "email": '#(mail)',
          "gender": '#string',
          "status": '#string'
      }

      """
    
    And match   $[*] == '#[5]'
    And match responseHeaders contains {'Content-Type': '#present' }
    And def id = response.id
    * print id
    #get created user
    Given url baseurl + id
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 200
    And print response
 
    And match $[*] == '#[5]'
    And match response.id == id
    And match response ==
      """
      { 
      "id": '#number',
         "name": '#(nm)',
          "email": '#(mail)',
          "gender": '#string',
          "status": '#string'
      }

      """
      
      # update user
      Given url baseurl + '6823516'
      And header Authorization = 'Bearer '+ token
      And request { 'email': 'tests@fdfdf.com' }
      When method put
      And match [422 , 200] contains responseStatus
    # And match responseStatus == 422 ? { * assert response.message == 'is invalid' } : { * assert response.id == '#present'}
    
      
      
    #delete created user
    Given url baseurl + id
    And header Authorization = 'Bearer ' + token
    When method Delete
    Then status 204
   
    
    #delete invalid user
    Given url baseurl + id
    And header Authorization = 'Bearer ' + token
    When method Delete
    Then status 404   
    And match response contains { 'message': 'Resource not found' }
