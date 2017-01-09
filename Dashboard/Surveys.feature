Feature: Surveys
This dashboard shows the surveys and their status.

  Scenario: Surveys
    Given I am a new member
     When I enter the site
     Then I see surveys that I need to take
  
  Scenario Outline: Survey Fields
    Given a survey
     When the survey is stored
     Then it has <fields> and <characteristics>
  
    Examples: 
      | fields      | characteristics                | 
      | Survey ID   | unique survey GUID             | 
      | Survey Name | survey name                    | 
      | Date/Time   | date and time survey was taken | 
  
  Scenario Outline: Survey Status
    Given I have surveys
     Then I see <status> and <characteristics>
  
    Examples: 
      | status    | characteristics                                                               | 
      | New       | a new survey that has not been taken by the member                            | 
      | Expiring  | a survey that is time sensitive                                               | 
      | Completed | a survey that has been completed, can view read only answers to the questions | 
  
  Scenario: Expose Survey API for GET
    Given a client or member wants to access surveys
     When they consume the secure endpoint at https://services.myapp.com/surveys/{surveyId}
      And provide their survey identifier
     Then they can GET their information
  
  
