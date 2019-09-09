Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
  @clear_basket
  Scenario: Visit product detail page
    Given I visit the Deal homepage
    And I search for product "Marice Canvas Dark Blue Slip-ons"
    When I visit the first product detail page
    Then I see navigation bar exists
    And I see search bar exists
    And I see breadcrumb exists
    And I see product information box exists
    And I click add to basket
    Then I should see error message "Please select Size"
    And I close information box
    And I select size
    And I click add to basket
    Then I should see mini cart appears with product added
    And I see add to favourites button exists
    And I see share button exists
    And I see footer bar exists
    And I see account items exists

