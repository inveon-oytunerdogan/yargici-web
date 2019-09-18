Feature: Visiting category pages to apply some filter

  Scenario: Filter category
    Given I visit the Deal homepage
    And I navigate to women category
    Then I should be redirected to "/c/women-3"
    And I click on "cats" filter combobox
    And I select dresses on combobox
    Then I should be redirected to "/c/dresses-26"
    And I click on "size" filter combobox
    And I select size on combobox
    Then I should see selected filters
    And I click on "color" filter combobox
    Then I select color on combobox
    And I click on "brand" filter combobox
    And I select brand on combobox
    And I see products are listed


    Scenario: Sorting products by
      Given I visit the Deal homepage
      And I navigate to women category
      Then I should be redirected to "/c/women-3"
      When I click on "order-by" filter combobox
      And I select price low to high

