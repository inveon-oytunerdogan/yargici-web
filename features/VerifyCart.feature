Feature: Visiting category pages to apply some filter

  @clear_basket
  Scenario: Add product to basket and verify
    Given I visit the Deal homepage
    And I search for product "Team Ball Black Large Backpack"
    And I visit the first product detail page
    And I click add to basket
    And I should see "Team Ball Black Large Backpack" product is added to basket




