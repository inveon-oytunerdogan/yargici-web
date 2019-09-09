Feature: Visiting category pages to apply some filter

  Scenario: Enter promotion code to get discount
    Given I visit the Deal homepage
    When I search for product "Team Ball Scarlet Large Backpack"
    When I visit the first product detail page
    When I click add to basket
    Then I should see mini cart appears with product added
    When I click on view full bag
    And  I should be redirected to "/cart"
    And I click on promotion code
    And I enter promotion code as "InveonTest"
    And I click apply promotion code button
    And I should see remove discount button
    And I should see discount is applied
    #When I click on Confirm button on checkout

