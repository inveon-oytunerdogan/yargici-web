Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
 @log_out @mobile
 Scenario: Register a new user
    Given I visit the Yargici homepage
    And I navigate to register user page
    And I enter "#FirstName" as "Register Test First Name"
    And I enter "#LastName" as "Register Test Last Name"
    And I generate email with date time
    And I enter "#Phone" as "5375120880"
    And I enter "#Password" as "12345678"
    And I enter "#ConfirmPassword" as "12345678"
    And I accept subscription letter
    And I click sign up button




