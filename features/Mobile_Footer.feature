Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
 @mobile
   Scenario: Checking footer links on mobile
    Given I visit the Yargici homepage
    Then I check footer links under YARGICI
    |Hikayemiz|Kurumsal|Franchise|Kariyer|Mağazalar|
    And I check footer links under YARDIM
    |Site Haritası|Gizlilik Politikası|Sıkça Sorulan Sorular|KVKK|Bize Ulaşın|
    And I check footer links under KATEGORİLER
    |Elbise|Ayakkabı|Çanta|Kazak|Şal|Homeworks|
    And I enter "#NewsletterEmail" as "serbest@mailinator.com"
    And I close privacy policy message
    And I check privacy agreement checkbox
    When I click on arrow on newsletter
    Then I should see message box with text "Kaydolduğunuz İçin Teşekkür Ederiz"
    And I click on close button

 @mobile
    Scenario: Checking wrong email on newsletter on mobile
     Given I visit the Yargici homepage
     When I enter "#NewsletterEmail" as "serbest"
     And I close privacy policy message
     And I check privacy agreement checkbox
     When I click on arrow on newsletter
     Then I should see message box with text "Geçerli e-posta giriniz"
     And I click on close button

     @mobile
     Scenario: Checking each footer links on mobile
      Given I visit the Yargici homepage
      And I click on Yargıcı on footer
      And I click on "Hikayemiz" on footer
      Then I should be redirected to "/t/hakkimizda"
      And I click on Yargıcı on footer
      And I click on "Kurumsal" on footer
      Then I should be redirected to "/t/kurumsal"
      And I click on Yargıcı on footer
      And I click on "Kariyer" on footer
      Then I should be redirected to "/t/kariyer"
      And I click on Yargıcı on footer
      And I click on "Mağazalar" on footer
      Then I should be redirected to "/t/magazalar"
      And I click on Yardım on footer
      And I click on "Site Haritası" on footer
      Then I should be redirected to "/sitemap"
      And I click on Yardım on footer
      And I click on "Gizlilik Politikası" on footer
      Then I should be redirected to "/t/gizlilik-politikasi"
      And I click on Yardım on footer
      And I click on "Sıkça Sorulan Sorular" on footer
      Then I should be redirected to "/t/sikca-sorulan-sorular"
      And I click on Yardım on footer
      And I click on "Bize Ulaşın" on footer
      Then I should be redirected to "/t/bize-ulasin"












