Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly

   @mobile @clear_basket_mobile
   Scenario: Order complete through product details and cart on mobile
    Given I visit the Yargici homepage
    And I navigate to login page on mobile
    Then I should be redirected to "/login"
    Then I enter "#Email" as "serbest2@mailinator.com"
    And I enter "#Password" as "12345678"
    When I click login button
    And I click on hamburger
    Then I click on Giyim on navigation
    And I visit first product detail page
    And I select size variant on mobile
    And I add product to basket on mobile
    And I visit basket on mobile
    And I click on checkout button
    And I select shipment and billing address checkboxes
    And I click on complete button between basket and cart
    #And I visit cart after product added to basket
#    Then I click edit address button on checkout
 #   And I enter "#Address_Address1" as "5. Gazeteciler Sitesi 2. Söltaş Evleri K:14 Akatlar Istanbul Testtir"
  #  And I click on save on edit address on checkout
    #And I click complete order button
    Then I enter credit card information
    |5101521710307762|12|23|326|
    And I read and accept pre information form
    And I read and accept distance purchase form


 Scenario: Get links of link checker you may delete this when you notice
  Given I get






