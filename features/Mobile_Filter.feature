Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
  @mobile
 Scenario: Visiting category pages and applying filter options on mobile
   Given I visit the Yargici homepage
   #And I close information box on mobile
   And I click on hamburger
   And I click on Giyim on navigation
   And I apply size filter on mobile
   Then I should see filter is applied
    And I click on filter button on mobile
   And I remove applied filter

  @mobile
   Scenario: Checking price range filter and products listed on mobile
     Given I visit the Yargici homepage
    And I click on hamburger
    And I click on Giyim on navigation
    And I click on filter button on mobile
    And I select Fiyat Filter
    And I enter "#priceMin" as "68.00"
     And I enter "#priceMax" as "1799.00"
    And I click on apply filter on price filter
     And I should see product prices are in price filter interval on mobile




