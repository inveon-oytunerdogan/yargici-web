Feature: Visiting product details and checking page properties
  Make sure Cucumber and Capybara are wired up properly
 @desktop
   Scenario: Checking footer links
    Given I visit the Yargici homepage
    Then I check footer links under YARGICI
    |Hikayemiz|Kurumsal|Kariyer|Mağazalar|
    And I check footer links under YARDIM
    |Site Haritası|Gizlilik Politikası|Sıkça Sorulan Sorular|KVKK|Bize Ulaşın|
    And I check footer links under KATEGORİLER
    |Elbise|Ayakkabı|Çanta|Kazak|Şal|Homeworks|
    And I enter "#NewsletterEmail" as "serbest@mailinator.com"
    And I check privacy agreement checkbox
    When I click on arrow on newsletter
    Then I should see message box with text "Kaydolduğunuz İçin Teşekkür Ederiz"
    And I click on close button

 @desktop
    Scenario: Checking wrong email on newsletter
     Given I visit the Yargici homepage
     When I enter "#NewsletterEmail" as "serbest"
     And I check privacy agreement checkbox
     When I click on arrow on newsletter
     Then I should see message box with text "Geçerli e-posta giriniz"
     And I click on close button

 @desktop
     Scenario: Checking each footer links
      Given I visit the Yargici homepage
      And I click on "Hikayemiz" on footer
      Then I should be redirected to "/t/hakkimizda"
      And I click on "Kurumsal" on footer
      Then I should be redirected to "/t/kurumsal"
      And I click on "Kariyer" on footer
      Then I should be redirected to "/t/kariyer"
      And I click on "Mağazalar" on footer
      Then I should be redirected to "/t/magazalar"
      And I click on "Site Haritası" on footer
      Then I should be redirected to "/sitemap"
      And I click on "Gizlilik Politikası" on footer
      Then I should be redirected to "/t/gizlilik-politikasi"
      And I click on "Sıkça Sorulan Sorular" on footer
      Then I should be redirected to "/t/sikca-sorulan-sorular"
      And I click on "Bize Ulaşın" on footer
      Then I should be redirected to "/t/bize-ulasin"
      #And I click on "Elbise" on footer
      #Then I should be redirected to "/elbise"
      #And I click on "Ayakkabı" on footer
      #Then I should be redirected to "/ayakkabi"
      #And I click on "Çanta" on footer
      #Then I should be redirected to "/canta"
      #And I click on "Kazak" on footer
      #Then I should be redirected to "/kazak"
      #And I click on "Şal" on footer
      #Then I should be redirected to "/sal"
      #And I click on "Homeworks" on footer
      #Then I should be redirected to "/homeworks"



    







