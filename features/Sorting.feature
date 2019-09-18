Feature: Visiting category pages to sort products by attribute
  @desktop
    Scenario: Sorting products by price low to high
      Given I visit the Deal homepage
      And I navigate to women category
      When I click on "order-by" filter combobox
      And I select price low to high
      Then I should see products are sorted price low to high

  @desktop
  Scenario: Sorting products by price high to low
    Given I visit the Deal homepage
    And I navigate to women category
    When I click on "order-by" filter combobox
    And I select price high to low
    Then I should see products are sorted price high to low



