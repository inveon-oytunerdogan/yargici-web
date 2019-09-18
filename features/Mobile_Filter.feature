Feature: Visiting category pages to apply some filter

  @mobile
  Scenario: Filter category on mobile browser
    Given I visit the Deal homepage
    And I click on hamburger
    And I navigate to women category
    And I click dresses on menu
    And I click on filter
    And I click on size
    And I select size on mobile
    And I click on filter
    And I click on brand on mobile
    And I select brand on mobile
    And I click on filter
    And I click on color filter on mobile
    And I select color on mobile
    And I click on filter
    And I click on filter by price on mobile
    And I enter "#priceMin" as "100"
    ##And I enter "#priceMax" as "2000"
       ##Waiting for bug fix https://inveon.atlassian.net/browse/PROJ-13298
    And I click on filter button

  @mobile
  Scenario: Sorting products by attribute on mobile browser
    Given I visit the Deal homepage
    And I click on hamburger
    And I navigate to women category
    And I click dresses on menu
    And I click on sort
    And I select price low to high on mobile

