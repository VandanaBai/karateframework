Feature: get filtered list

@ignore
  Scenario: get filtered users
    Given url baseurl
  #  And header Authorization = 'Bearer ' + token
    When method GET
    Then status 200
      * def res = response
      * def uuid = function(){ return java.util.UUID.randomUUID() + '@gmaik' }
      * print res
      * def xxx = uuid()
      * print xxx
      * def asdd = response.filter(x => x.status == 'inactive' && x.gender != 'male')
      
       # * def items = get asdd[*]
    * def idss = $asdd[*].name
    
     # * def ab = asdd[*].name
     * def ids = $[*].name

* def number = []
* eval for(var i = 0; i < response.length; i++) if(response[i].status == 'inactive' ) number.push("hi" + response[i].name)
  
    * print number
  * print asdd
* print ids
  * print idss
   
