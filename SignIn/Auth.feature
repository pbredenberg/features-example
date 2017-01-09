Feature: Authentication
Member portal authenticates with Google, Twitter, Facebook and Okta.

  Scenario: Oauth
    Given I want to use OAuth
     When I sign up
     Then I can sign up with <providers>
      | providers | 
      | Google    | 
      | Twitter   | 
      | Facebook  | 
  
  Scenario: Okta
    Given I am authenticating
     Then I can use Okta as my provider
  
  
