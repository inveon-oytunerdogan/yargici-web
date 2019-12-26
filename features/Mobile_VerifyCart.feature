Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
  @mobile @clear_basket_mobile
 Scenario: Add product to basket and verify cart on mobile
   Given I visit the Yargici homepage
   And I click on hamburger
   And I search for "sırt çantası" on mobile
   And I visit first product detail page
   And I add product to basket on mobile
   And I visit basket on mobile
   And I click product on checkout
   And I should see visited product is added to basket


