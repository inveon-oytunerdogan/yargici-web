Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
  @mobile
  Scenario: Register a new user
    Given I visit the Deal homepage
    And I navigate to login page
    And I click create an account button
    Then I should be redirected to "/register"
    Then I enter "#FirstName" as "Register  First Name"
    And I enter "#LastName" as "Register Last Name"
    And I generate email with date time
    And I enter "#Phone" as "525554606 "
    And I enter "#Password" as "12345678"
    And I enter "#ConfirmPassword" as "12345678"
    And I select date on option dropdown
    And I select month on option dropdown
    And I select year on option dropdown
    And I click on register button
    Then I should see account activation message

