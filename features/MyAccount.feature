Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly

 @desktop @log_out @delete_address
 Scenario:Adding new address on my account
  Given I visit the Yargici homepage
  And I navigate to login page
  Then I should be redirected to "/login"
  Then I enter "#Email" as "oytun.erdogan@inveon.com.tr"
  And I enter "#Password" as "12345678"
  When I click login button
  Then I should be redirected to "/?login=1"
  And I navigate to addresses
  And I click on add new address button
  And I enter "#Address_FirstName" as "Oytun"
  And I enter "#Address_LastName" as "Erdoğan"
  And I enter "#Address_Email" as "oytun.erdogan@inveon.com.tr"
  And I enter "#Phone" as "5375120880"
  And I select Turkey on dropdown
  And I select City Istanbul on dropdown
  And I select County Besiktas on dropdown
  And I enter "#Address_Address1" as "5. Gazeteciler Sitesi 2. Söltaş Evleri K:14 Akatlar Istanbul"
  And I enter "#Address_ZipPostalCode" as "34335"
  And I click on save address button
  And I click edit address button on basket
  And I select Turkey on dropdown
  And I enter "#Address_Address1" as "5. Gazeteciler Sitesi 2. Söltaş Evleri K:14 Akatlar Istanbul Testtir"
  And I click on save address button

 @log_out
  Scenario: Delete all addresses
   Given I visit the Yargici homepage
   And I navigate to login page
   Then I should be redirected to "/login"
   Then I enter "#Email" as "oytun.erdogan@inveon.com.tr"
   And I enter "#Password" as "12345678"
   When I click login button
  Given I delete all adresses
