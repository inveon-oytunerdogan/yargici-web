Feature: Forgetting password
  Make sure Cucumber and Capybara are wired up properly
 @desktop
 Scenario: Requesting new password
  Given I visit the Yargici homepage
  And I navigate to login page
  And I click on forgot password button
  And I enter "#Email" as "oytun.erdogan@inveon.com.tr"
  And I click on send password button
  And I should see password change mail sent message



