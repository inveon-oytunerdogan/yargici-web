Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly

 Scenario: Visiting category pages and applying filter options
   Given I visit the Yargici homepage
   #And I close privacy policy message
   And I click on Giyim on navigation
   And I apply size filter
   Then I should see filter is applied
   And I remove applied filter

   Scenario: Checking price range filter and products listed
     Given I visit the Yargici homepage
     And I click on Giyim on navigation
     And I enter "#priceMin" as "68.00"
     And I enter "#priceMax" as "1799.00"
     And I click on apply filter button
     And I should see product prices are in price filter interval




