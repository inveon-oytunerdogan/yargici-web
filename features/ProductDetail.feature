Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
 @desktop
   Scenario: Checking product detail items
    Given I visit the Yargici homepage
    Then I click on Giyim on navigation
    And I visit first product detail page
    And I select size variant
    And I check product information
    And I check breadcrumb
    #And I check recommendation carousels
    And I check size fit link









