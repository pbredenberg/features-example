Feature: Main.Account
The account page allows a member (user) to view and administer their account.
All accounts are preloaded based on census data from the client.
Census data is very simple data that identifies the member.

  Scenario Outline: Permissions and Account Types
    Given the site
     Then there are <permissions>
      And <characteristics>
  
    Examples: 
      | permissions           | characteristics                                                             | 
      | site administrator    | only developers and architects are assigned this permission                 | 
      | account administrator | people who will upload census data and can see statistics about the members | 
      | client adminstrator   | can access only their client account information                            | 
      | member                | can access only their portal account                                        | 
      | whatever              | etc                                                                         |
  
  Scenario Outline: Census Data
    Given a new client
      And member <census data> with <characteristics>
     When the member census data is added to the portal
     Then members are enrolled
      And an account is setup for them
  
    Examples: 
      | census data                | characteristics                                                                    | 
      | memberId                   | unique identifier for SimpleNext, never visible on the UI                          | 
      | ssn                        | social security number, first 5 masked                                             | 
      | memberFirstName            | member first name                                                                  | 
      | memberMiddleName           | member middle name                                                                 | 
      | memberLastName             | member last name                                                                   | 
      | memberEmail                | email address of member, prefix@suffix.com                                         | 
      | memberDateOfBirth          | member date of birth, mmddyyyy                                                     | 
      | memberAddress              | member address 1                                                                   | 
      | memberAddressExtended      | extended member address                                                            | 
      | memberCity                 | member city                                                                        | 
      | memberStateProvince        | member state or province                                                           | 
      | memberCountry              | member country                                                                     | 
      | memberPostalCode           | member postal code                                                                 | 
      | memberHireDate             | date of hire, mmddyyyy                                                             | 
      | memberGender               | male, female, not disclosed                                                        | 
      | memberTelephone            | format aaaeeennnn                                                                  | 
      | memberTelephoneCountryCode | country code                                                                       | 
      | clientName                 | name of client                                                                     | 
      | clientAddress              | address of client                                                                  | 
      | clientAddressExtended      | extended client address                                                            | 
      | clientCity                 | client city                                                                        | 
      | clientStateProvince        | client state or province                                                           | 
      | clientPostalCode           | client postal code 12345 2343 or a2a 3d2                                           | 
      | clientTelephone            | format aaaeeennnn                                                                  | 
      | clientTelephoneCountryCode | country code                                                                       | 
      | preferredLanguage          | iso codes en-US, etc.)                                                             | 
      | ethnicity                  | free form text                                                                     | 
      | clientIdentifier           | client this member is associated with, may be an array because travels with member | 
      | status                     | employer or freelance                                                              | 
  
  Scenario Outline: Invitation Email
    Given census data has been added to the database
     When the member record has completed
     Then an email is sent with <content> and <characteristics>
      And the email expires within 24 hours
  
    Examples: 
      | content              | characteristics                                  | 
      | Member Name          | name of the member                               | 
      | Link                 | link to member portal with their invitation code | 
      | GUID                 | invitation code                                  | 
      | Expiration Date/Time | date and time the invitation expires             | 
  
  Scenario: Validation of Email
    Given a member navigates to their invitation link
     When the site receives their invitation code
     Then their code is validated
      And if validated
     Then the member is forced to reset their password
  
  Scenario: Editable Fields
    Given a member record
     When the member reviews their record
     Then they can edit <fields>
      | fields            | 
      | Telephone Number  | 
      | Email Address     | 
      | Address 1         | 
      | Address Extended  | 
      | City              | 
      | State or Province | 
      | Postal Code       | 
  
  Scenario: Inactive Members
    Given a member is no longer employed at a company
     Then they still can access their account
      But their status is set to freelance
  
  Scenario: Deleting Members
    Given a member is to be deleted
     Then only site admistrators can delete a member
      And the record is completely removed from the database
  
  Scenario: Expose Member API
    Given a client or member wants to access their information
     When they consume the secure endpoint at https://services.myapp.com/members/{memberId}
      And provide their member identifier
     Then they can retrieve their information
  
  
