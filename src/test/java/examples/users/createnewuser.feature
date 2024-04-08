Feature: pass the required data to post method

@ignore

  Scenario: post method call
    * def myurl = baseurl
    * def emails = call read('classpath:examples/createdynamicmail.js'){ number: '#(4)'}
    * print emails
    * def maily = call read('classpath:examples/email.feature')
    * def reqpayload = read('classpath:payloads/reqpayloadpost.json');
    And set reqpayload.email = maily.mailf
    * def postresp =  call read('classpath:examples/postmethod.feature'){ urlvar: '#(myurl)', reqBody: '#(reqpayload)'}
    * print postresp.resp
    * match postresp.responseStatus == 201
    * print postresp.responseTime
    * match postresp.resp.email == maily.mailf
     * print id
   
    
