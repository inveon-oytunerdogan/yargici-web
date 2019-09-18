Feature: Visiting category pages to apply some filter

  @mobile
  Scenario: Check footer links on mobilel browser
    Given I visit the Deal homepage
    Then I check footer links
    |CONTACT US| ABOUT US| TERMS & CONDITIONS|PRIVACY & COOKIES POLICY|
    When I click on "CONTACT US" on footer
    Then I should be redirected to "/pages/help"
    When I click on "ABOUT US" on footer
    Then I should be redirected to "/pages/about-us"
    When I click on "TERMS & CONDITIONS" on footer
    Then I should be redirected to "/pages/terms-and-conditions"
    When I click on "PRIVACY & COOKIES POLICY" on footer
    Then I should be redirected to "/pages/privacy-policy"






