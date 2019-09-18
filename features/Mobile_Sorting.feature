Feature: Visiting category pages to sort products by attribute
    @mobile
    Scenario: Sorting products by price low to high on mobile
      Given I visit the Deal homepage
      And I click on hamburger
      And I navigate to women category
      And I click dresses on menu
      And I click on sort
      And I select price low to high on mobile
      Then I should see products are sorted price low to high

  @mobile
  Scenario: Sorting products by price high to low on mobile
    Given I visit the Deal homepage
    And I click on hamburger
    And I navigate to women category
    And I click dresses on menu
    And I click on sort
    And I select price low to high on mobile
    Then I should see products are sorted price high to low



