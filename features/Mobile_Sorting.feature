Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
  @mobile
 Scenario: Visiting category pages and and applying sortings price high to low
    Given I visit the Yargici homepage
    Then I click on Giyim on navigation
    When I select price high to low sorting
    Then I should see products are sorted price high to low

  @mobile
 Scenario: Visiting category pages and and applying sortings price low to high
  Given I visit the Yargici homepage
  Then I click on Giyim on navigation
  When I select price low to high sorting
  Then I should see products are sorted price low to high



