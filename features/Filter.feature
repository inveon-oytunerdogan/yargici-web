Feature: Ensure size and price filters are working
  Make sure Cucumber and Capybara are wired up properly
  @desktop
 Scenario: Visiting category pages and applying filter options
   Given I visit the Yargici homepage
   #And I close privacy policy message
   And I click on Giyim on navigation
   And I apply size filter
   Then I should see filter is applied
   And I remove applied filter

  @desktop
   Scenario: Checking price range filter and products listed
     Given I visit the Yargici homepage
     And I click on Giyim on navigation
     And I click on price filter button
     And I enter "#priceMin" as "68.00"
     And I enter "#priceMax" as "1799.00"
     And I click on apply price filter button
     And I should see product prices are in price filter interval




