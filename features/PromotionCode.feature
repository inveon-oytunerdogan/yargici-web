Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
   @log_out @desktop @clear_basket
   Scenario: Apply promotion code
     Given I visit the Yargici homepage
     And I navigate to login page
     Then I should be redirected to "/login"
     Then I enter "#Email" as "oytun.erdogan@inveon.com.tr"
     And I enter "#Password" as "12345678"
     When I click login button
     Then I should be redirected to "/?login=1"
     And I click on Giyim on navigation
     And I visit first product detail page
     And I select size variant
     And I add product to basket
     And I visit basket
     When I enter promotion code as "OYTUNTEST"
     And I should see discount applied message
     And I cancel promotion code
