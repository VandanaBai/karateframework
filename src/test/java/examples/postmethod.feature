Feature: post method resuable file

Background:
* header Content-Type = 'application/json'
* header Authorization = 'Bearer ' + token

@ignore
Scenario: post method
Given url urlvar
And request reqBody
When method Post
* def resp = response
