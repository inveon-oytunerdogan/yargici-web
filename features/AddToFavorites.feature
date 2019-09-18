Feature: Visiting category pages to apply some filter

  @clear_favorites @clear_basket @log_out
  Scenario: Add products to favorites
    Given I visit the Deal homepage
    And I navigate to women category
    And I visit the first product detail page
    When I click on add to favorites button
    Then I should be redirected to "/login"
    And I enter "#Email" as "oytun.erdogan@inveon.com.tr"
    And I enter "#Password" as "12345678"
    When I click login button
    When I click on add to favorites button
    Then I should see product is added to favorites
    And I close favorite product added information box
    Then I should see "1" on heart logo
    When I navigate to favorites page
    Then I should see favorite products is not empty
    When I click on edit button
    And I select size
    And I click add to basket
    Then I should see mini cart appears with product added




