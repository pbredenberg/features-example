Feature: SiteAdministrator.Account
The site administrator manages setting up clients and deleting members.

  Scenario Outline: Permissions and Account Types
    Given the site
     Then there are <permissions>
      And <characteristics>
  
    Examples: 
      | permissions           | characteristics                                                             | 
      | site administrator    | only developers and architects are assigned this permission                 | 
      | account administrator | people who will upload census data and can see statistics about the members | 
      | client adminstrator   | can access only their client account information                            | 
      | member                | invited to access the portal can access only their portal account, members can be associated with a client                                        | 
      |user|everyone who is in the system|
  
  Scenario: Access All Clients
  # 
    Given I am a site administator
     When I log in
     Then I see a list of all clients
      And members within clients
      And all users
      And can administrater clients
      And members
      And users
  
  Scenario: Setup New Site Administrator
    Given I want to add a new site administrator
     When I access the users page
     Then I can add a new administrator by providing <fields>
      | fields           | 
      | First Name       | 
      | Last Name        | 
      | Email Address    | 
      | Telephone Number | 
  
  Scenario: Delete Site Administrators
    Given I want to delete site administrators
     When I try 
     Then I can delete everyone but myself
      And the primary
  
  Scenario: Primary Site Administrator
    Given a list of site administrators
     When I set the first one up
     Then they become a primary
      But I can assign anyone a primary
  
