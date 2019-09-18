Feature: Visiting category pages to apply some filter

  @mobile_clear_favorites @clear_basket @mobile_log_out @mobile
  Scenario: Add products to favorites on mobile browser
    Given I visit the Deal homepage
    And I click on hamburger
    And I navigate to women category
    And I click dresses on menu
    And I visit the first product detail page on mobile
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
    And I click add to basket on mobile
    And I select size
    And I click add to basket
    Then I should see mini cart appears with product added on mobile




