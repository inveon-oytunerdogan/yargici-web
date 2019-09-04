Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly

  Scenario: Add new address to user logged in
    Given I visit the Deal homepage
    And I navigate to login page
    Then I should be redirected to "/login"
    Then I enter "#Email" as "oytun.erdogan@inveon.com.tr"
    And I enter "#Password" as "12345678"
    When I click login button
    Then I should be redirected to "/?login=1"
    And I click on my addresses button
    Then I should be redirected to "/customer/addresses"
    And I click add new address button
    And I select UAE on dropdown
    And I select Dubai on dropdown
    And I enter "#addressLine" as "5. Gazeteciler Sitesi 2. Söltaş Evleri K:14 Akatlar Istanbul"
    And I enter "#zipCode" as "34333"
    And I click save button
    When I click on edit button for addresses
    And I select UAE on dropdown
    And I select Dubai on dropdown
    And I enter "#addressLine" as "5. Gazeteciler Sitesi 2. Söltaş Evleri K:14 Akatlar Istanbul Testtir"
    And I enter "#zipCode" as "34333"
    And I click save button
    Then I delete address
    And I logout




