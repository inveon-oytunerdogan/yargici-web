Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
   @mobile
   Scenario: Check product is same as added on basket on mobile
    Given I visit the Yargici homepage
     And I close information box on mobile
    And I click on hamburger
    Then I click on Giyim on navigation
    And I visit first product detail page
    And I select size variant on mobile
    And I add product to basket on mobile
    #When I add product to basket
    #Then I accept max stock product limit alert box
    And I hover on cart
    And I delete basket items on mobile
    And I accept delete basket items message box








