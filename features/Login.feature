Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
   @log_out @desktop
   Scenario: Login on home page
     Given I visit the Yargici homepage
     And I navigate to login page
    Then I should be redirected to "/login"
     Then I enter "#Email" as "oytun.erdogan@inveon.com.tr"
     And I enter "#Password" as "12345678"
     When I click login button
     Then I should be redirected to "/?login=1"

 @desktop
 Scenario: Logging out on my account page
  Given I visit the Yargici homepage
  And I navigate to login page
  Then I enter "#Email" as "oytun.erdogan@inveon.com.tr"
  And I enter "#Password" as "12345678"
  When I click login button
  Then I should be redirected to "/?login=1"
  Then I navigate to order history
  And I logout on my account




