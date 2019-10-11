Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
  @mobile @clear_basket
 Scenario: Add product to basket and verify cart
   Given I visit the Yargici homepage
   And I search for "sırt çantası"
   And I visit first product detail page
   And I add product to basket
   And I visit basket
   And I click product on checkout
   And I should see visited product is added to basket


