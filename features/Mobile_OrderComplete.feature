Feature: Demo
  Make sure Cucumber and Capybara are wired up properly
  @clear_basket @mobile
  Scenario: Visit home page through checkout without login on mobile browser
    Given I visit the Deal homepage
    And I search for product "Shadow Switch Dry Brush Makeup Remover"
    When I visit the first product detail page
    When I click add to basket
    Then I should see mini cart appears with product added
    When I click on view full bag
    And  I should be redirected to "/cart"
    When I click on Confirm button on checkout
    Then I should be redirected to "/login"
    And I click on Checkout as Guest
    And I should be redirected to "/checkout/onepagecheckout"
    Then I enter mail address "oytun.erdogan@inveon.com.tr"
    And I enter "#firstName" as "Oytun"
    And I enter "#lastName" as "Erdoğan"
    And I enter "#Phone" as "00905375120880"
    And I select UAE on dropdown
    And I select Dubai on dropdown
    And I enter delivery address "Test Test test"
    And I should see "#deliveryOptionsContainer" part is disabled
    And I should see "#paymentForm" part is disabled
    And I save address
    And I enter credit card information
      |4242 4242 4242 4242| 12 | 21 | 123|
    Then I click on place my order button
#    And I see transaction is aborted message
### Proper test card will be added

