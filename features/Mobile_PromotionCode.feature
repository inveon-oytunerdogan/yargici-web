Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
  @mobile @log_out_mobile  @clear_basket_mobile
   Scenario: Apply promotion code on mobile
     Given I visit the Yargici homepage
     And I close information box on mobile
     And I navigate to login page on mobile
     Then I enter "#Email" as "oytun.erdogan@inveon.com.tr"
     And I enter "#Password" as "12345678"
     When I click login button
     Then I should be redirected to "/?login=1"
     And I click on hamburger
     And I click on Giyim on navigation
     And I visit first product detail page
     And I select size variant on mobile
     And I add product to basket on mobile
     And I visit basket on mobile
     When I enter promotion code as "OYTUNTEST"
     And I should see discount applied message
     And I cancel promotion code
