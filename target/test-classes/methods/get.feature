Feature: getgg
@ignore
  Scenario: getgg
    Given url baseurl
    When method get
    Then status 200
    And print response
       * def time = responseTime
    And match response == '#[] #object'
     And match $[*] == '#[10]'
        And assert $[*] == 10
    * def filterd_data = response.filter(x => x.gender == 'male' && x.status != 'inactive')
    * def names = $filterd_data[*].name
    * print 'active male users are',  names
    And match names == '#[] #string'
   #And assert $[*] > '#[1]'
   #  And match $names[*] == '#[4]'

   * print time
   * print responseTime
   And assert time < 900
   And print responseHeaders
  # * match karate.response.header('content-type') == 'application/json'
  # * match karate.response.header contains 'application/json'
   And match responseHeaders['Content-Type'][0] == 'application/json; charset=utf-8'
   And match responseHeaders contains { 'Content-Encoding': '#notpresent' }
   And match responseHeaders contains { 'Content-Type': '#present' }

   And match responseHeaders contains { 'Content-Type': ["application/json; charset=utf-8"] }
   
   Scenario: my get

    Given url baseurl
    When method get
    Then status 200
    And print response
    And assert responseTime < 900
    And match responseHeaders contains { 'Content-Type': ["application/json; charset=utf-8"] }
    And match responseHeaders contains { 'Content-Type': '#present' }
    And match response == '#[] #object'
    
    * def filtered = response.filter(x => x.status == 'male')
    * def names = $filtered[*].name
    * print names
    
    Scenario: single valid user
    
    Given url baseurl+6823506
    When method GET
    Then status 200
    And assert responseTime < 900
    And match response == '#object'
    And assert response.id == 6823506
    
    Scenario: single invalid user
    
    Given url baseurl+6
    When method GET
    Then status 404
    And assert responseTime < 900
    And match response == '#object'
    And assert response.message == 'Resource not found'
    And print response
    And match response contains { 'message': 'Resource not found' }
    
    
