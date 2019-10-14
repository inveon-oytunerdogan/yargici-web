Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
 @mobile
   Scenario: Checking product detail items on mobile
    Given I visit the Yargici homepage
    And I click on hamburger
    Then I click on Giyim on navigation
    And I visit first product detail page
    And I select size variant on mobile
    And I click on size button on mobile
    And I check size fit link
    And I check product information
    And I check breadcrumb









