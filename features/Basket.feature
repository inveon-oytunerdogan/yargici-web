Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
 @desktop
   Scenario: Check product is same as added on basket
    Given I visit the Yargici homepage
    Then I click on Giyim on navigation
    And I visit first product detail page
    And I select size variant
    And I add product to basket
    #When I add product to basket
    #Then I accept max stock product limit alert box
    And I hover on cart
    And I delete basket items
    And I accept delete basket items message box








