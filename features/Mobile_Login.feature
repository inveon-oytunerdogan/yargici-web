Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
  @mobile @mobile_log_out
  Scenario: Login a user on mobile browser
    Given I visit the Deal homepage
    And I navigate to login page
    Then I should be redirected to "/login"
    Then I enter "#Email" as "oytun.erdogan@inveon.com.tr"
    And I enter "#Password" as "12345678"
    When I click login button
    Then I should be redirected to "/?login=1"