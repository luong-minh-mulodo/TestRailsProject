Feature: Manage User
  Scenario: Create User
    Given I want contructor user name with "x4", password with "e10adc3949ba59abbe56e057f20f883e",email with "x4@mail.com"
    When I call create User
    Then I should see user have databaes
    
   Scenario: Remove a user
     Given delete: I find user name with "long"
     When I will delete name "long"
     Then I should see not user database