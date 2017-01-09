Feature: Sign In
Sign in is a simple process with key functionality related to account adminstration.

  Scenario: Username and Password
    Given I have registered with my invitation link
     When I provide my username
      And password
     Then I can sign in
  
  Scenario: Username
  The username is the email address
     When a username
     Then an email address
  
  Scenario: Password Complexity
    Given a password
     Then the password must be a phrase
  
  Scenario: Forgot Password
    Given a user has forgotten a password
     When they register their username
     Then their temporary password link is emailed to their email on record
      And they can reset their password
  
  Scenario: Forgot Username
    Given a user has forgotten their username
     Then they should not get into the site because it is their email address
  
  Scenario: Sign In Attempts
    Given a user tries to sign in 5 times
     Then they cannot try again for 15 minutes
