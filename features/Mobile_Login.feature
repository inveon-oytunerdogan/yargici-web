Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
   @mobile @log_out_mobile
   Scenario: Login on home page on mobile
     Given I visit the Yargici homepage
     And I navigate to login page on mobile
    Then I should be redirected to "/login"
     Then I enter "#Email" as "oytun.erdogan@inveon.com.tr"
     And I enter "#Password" as "12345678"
     When I click login button
     Then I should be redirected to "/?login=1"




