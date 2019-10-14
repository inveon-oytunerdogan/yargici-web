Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
  @mobile
 Scenario: Visiting category pages and and applying sortings price high to low on mobile
    Given I visit the Yargici homepage
    And I click on hamburger
    Then I click on Giyim on navigation
    When I select price high to low sorting
    Then I should see products are sorted price high to low

  @mobile
 Scenario: Visiting category pages and and applying sortings price low to high on mobile
  Given I visit the Yargici homepage
  And I click on hamburger
  Then I click on Giyim on navigation
  When I select price low to high sorting
  Then I should see products are sorted price low to high



