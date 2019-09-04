Feature: Forgetting password and recovery steps

  Scenario: Recover password
    Given I visit the Deal homepage
    And I navigate to login page
    Then I should be redirected to "/login"
    When I click forgot password
    Then I should be redirected to "/passwordrecovery"
    Then I enter "#Email" as "oytun.erdogan@inveon.com.tr"
    When I click reset my password button
    Then I should see password recovery email is sent message