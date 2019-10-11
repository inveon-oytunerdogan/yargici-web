Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly

 @desktop  @clear_basket @log_out
   Scenario: Order complete through product details and cart
    Given I visit the Yargici homepage
    And I navigate to login page
    Then I should be redirected to "/login"
    Then I enter "#Email" as "oytun.erdogan@inveon.com.tr"
    And I enter "#Password" as "12345678"
    When I click login button
    Then I click on Giyim on navigation
    And I visit first product detail page
    And I select size variant
    And I add product to basket
    And I visit basket
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









