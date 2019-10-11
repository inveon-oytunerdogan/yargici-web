Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly

   Scenario: Login page through favourites button
    Given I visit the Yargici homepage
    Then I click on Giyim on navigation
    And I visit first product detail page
    And I add product as favourite
    And I should be redirected to "login"


   @clear_favourites @log_out
   Scenario: Logged in user add to favourites
    Given I visit the Yargici homepage
    And I navigate to login page
    Then I enter "#Email" as "oytun.erdogan@inveon.com.tr"
    And I enter "#Password" as "12345678"
    When I click login button
    Then I click on Giyim on navigation
    And I visit first product detail page
    And I add product as favourite
    And I see product added to favourites information box
    And I close information box





