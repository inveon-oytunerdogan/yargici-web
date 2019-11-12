#encoding: UTF-8
#
Given(/^I visit the Yargici homepage$/) do
  visit 'https://www.yargici.com/'
  sleep 6
end

And(/^I navigate to login page$/) do
  sleep 1
  all(".d-inline-block.align-middle.customer-list-item.mr-md-1")[1].hover
  find(".guest-menu-link.bg-white.with-login.d-block.p-3.text-dark.text-center.font-weight-bold.p-2", match: :first).click
end

Then(/^I should be redirected to "([^"]*)"$/) do |arg|
  sleep 2
  expect(page.current_url).to include(arg)
end

And(/^I enter "([^"]*)" as "([^"]*)"$/) do |arg1, arg2|
  find(arg1).set arg2
end

When(/^I click login button$/) do
  find(".btn.btn-site-primary.rounded-0.w-100.mt-3.p-3.login-button").click
end

Then(/^I navigate to order history$/) do
  visit 'https://www.yargici.com/order/history'
end

And(/^I logout on my account$/) do
  find(".no-list.m-0.p-0.customer-menu-list").all("li")[7].find("[href='/logout']").click
end

Then(/^I click on Giyim on navigation$/) do
  sleep 2
  tag = find(".MainMenu.main-menu.no-list.p-0.m-0.list-inline.text-center.position-relative.d-md-inline-block.active")
  tag.all("li")[1].hover
  tag.first("[href='/giyim']").click
end

And(/^I visit first product detail page$/) do
  first(".col-6.col-xs-6.col-sm-6.col-md-4.col-lg-4.col-xl-4.product-grid-item-container.p-0").click
  sleep 2
  $product_link = page.current_url
end

And(/^I add product as favourite$/) do
  sleep 5
  find(:xpath, '//*[@id="product-details-form"]/div/div[1]/div/div[2]/div/ul/li[1]/span/span').click
  sleep 5
end

And(/^I see product added to favourites information box$/) do
 expect(find(".favorite-result-message").text).to include("İlgili ürün favori listenize eklenmiştir. Favori listeniz için ")
end

And(/^I close information box$/) do
  find(:xpath, '//*[@id="add-to-favorites-modal"]/div/div/div[1]/button/i').click
  sleep 1
end

And(/^I navigate to register user page$/) do
  sleep 2
  all(".d-inline-block.align-middle.customer-list-item.mr-md-1")[1].hover
  all(".guest-menu-link.bg-white.with-login.d-block.p-3.text-dark.text-center.font-weight-bold.p-2")[1].click
end

And(/^I accept subscription letter$/) do
  find(:xpath, '//*[@id="register-form"]/div/div[10]/div/div[1]/div[2]/div/div[1]/div').first(".custom-check-label.m-0").click
end

And(/^I click sign up button$/) do
  find("#register-button").click
end

And(/^I generate email with date time$/) do
  time = Time.new
  puts time.year + time.month + time.day + time.usec
  find("#Email").set time.year.to_s + time.month.to_s + time.day.to_s + time.usec.to_s + "@gmail.com"
end


Then(/^I check footer links under YARGICI$/) do |table|
  # table is a table.hashes.keys # => [:Hikayemiz, :Kurumsal, :Kariyer, :Mağazalar]
  table = table.raw[0]
  links = all(".footer-list-menu")[0].all(".d-block")
  expect(links[0].text).to eq(table[0])
  expect(links[1].text).to eq(table[1])
  expect(links[2].text).to eq(table[2])
  expect(links[3].text).to eq(table[3])
end


And(/^I check footer links under YARDIM$/) do |table|
  # table is a table.hashes.keys # => [:Site Haritası, :Gizlilik Politikası, :Sıkça Sorulan Sorular, :Bize Ulaşın]
  table = table.raw[0]
  links = all(".footer-list-menu")[1].all(".d-block")
  expect(links[0].text).to eq(table[0])
  expect(links[1].text).to eq(table[1])
  expect(links[2].text).to eq(table[2])
  expect(links[3].text).to eq(table[3])
end

And(/^I check footer links under KATEGORİLER$/) do |table|
  # table is a table.hashes.keys # => [:Elbise, :Ayakkabı, :Çanta, :Kazak, :Şal, :Homeworks]
  table = table.raw[0]
  links = all(".footer-list-menu")[2].all(".d-block")
  expect(links[0].text).to eq(table[0])
  expect(links[1].text).to eq(table[1])
  expect(links[2].text).to eq(table[2])
  expect(links[3].text).to eq(table[3])
  expect(links[4].text).to eq(table[4])
  expect(links[5].text).to eq(table[5])

end

And(/^I check privacy agreement checkbox$/) do
  find(:xpath, '/html/body/footer/div[2]/div/div[1]/div/div/div/div[4]/div/div[3]/div/label').click
end

When(/^I click on arrow on newsletter$/) do
  find(".icon-ico_slide-lright.arrow-newsletter").click
  sleep 3
end

Then(/^I should see message box with text "([^"]*)"$/) do |arg|
  text = find("#subscribeModal").find(".modal-body").text
  expect(text).to eq(arg)
end

And(/^I click on close button$/) do
  find("#subscribeModal").find(".btn.btn-site-primary.rounded-0").click
end

And(/^I click on "([^"]*)" on footer$/) do |arg|
  find("a", :text => arg, match: :first).click
end

And(/^I click on forgot password button$/) do
  sleep 1
  find(".mt-2.d-inline-block", match: :first).click
end

And(/^I click on send password button$/) do
  sleep 2
  find(".password-recovery-button.btn.btn-site-primary.rounded-0.w-100.p-2.mt-2.mt-md-0").click
end

And(/^I should see password change mail sent message$/) do
  expect(find(".font-italic.rounded.p-2.mb-2.in-no-list.bg-success.text-white").text).to eq("Şifre değişiklik bilgileriniz e-posta adresinize gönderildi.")
end

And(/^I navigate to addresses$/) do
  find(".icon-ico_mini-member-on.align-middle.user-icon").hover
  sleep 1
  find("a[href='/customer/addresses']").click
end

And(/^I click on add new address button$/) do
  find(".open-address-form.btn.btn-site-primary.rounded-0.float-right").click
end

And(/^I select Turkey on dropdown$/) do
  find("#Address_CountryId option[value='77']").select_option
end

And(/^I click on save address button$/) do
  find(".btn.btn-site-primary.rounded-0.float-right").click
end

And(/^I select size variant$/) do
  first(".size-list-label", visible: true).click
end

And(/^I add product to basket$/) do
  find(".add-to-cart-button.btn.rounded-0.text-white.font-weight-bold.col-12").click
  sleep 2

end

Then(/^I accept max stock product limit alert box$/) do
  page.driver.browser.switch_to.alert.accept
end

And(/^I hover on cart$/) do
  find(".cart-item-count.text-white.position-absolute.rounded-circle.text-center").hover

end

And(/^I delete basket items$/) do
  find(".delete-shopping-cart-item-icon.border-0.text-site-primary.outline-0").find(".icon-ico_close").click
end

And(/^I accept delete basket items message box$/) do
  find("#modal-btn-si").click
end

And(/^I visit cart after product added to basket$/) do
  find(".btn-black.btn.w-100.go-to-cart.mt-2.mb-3.p-3.p-lg-0").click
  sleep 2
end

And(/^I visit basket$/) do
  find(".cart-item-count.text-white.position-absolute.rounded-circle.text-center").hover
  find(".btn.btn-black.text-white.font-weight-bold.border-0.rounded.d-inline-block.bg-black.w-100.mt-2.mt-md-0").click
  sleep 3
end

And(/^I click on checkout button$/) do
  page.execute_script('$(".sp-advanced-css-345").remove()')
  find("#checkout").click
  sleep 7
end

And(/^I select City Istanbul on dropdown$/) do
  find("#Address_StateProvinceId option[value='74']").select_option
end

And(/^I select County Besiktas on dropdown$/) do
  find("#Address_CountyId option[value='446']").select_option
end

Then(/^I click edit address button on checkout$/) do
  find("#AddressEditButton").click
  sleep 1
end

And(/^I click on save on edit address on checkout$/) do
  find(".btn.btn-site-primary.rounded-0.loat-right").click
end

And(/^I click complete order button$/) do
  find("#form-submit").click
  sleep 2
end

Then(/^I enter credit card information$/) do |table|
  # table is a table.hashes.keys # => [:5101521710307762, :12, :23, :326]
  table = table.raw[0]
  find("#CardNumber").set table[0]
  find("#ExpireMonth option[value='#{table[1]}']").select_option
  find("#ExpireYear option[value='#{table[2]}']").select_option
  find("#CardCode").set table[3]
  find(".installment-label.align-middle.mr-2").click
end

And(/^I read and accept pre information form$/) do
  find(:xpath, '//*[@id="sticky-item"]/div[4]/div[1]/div[2]/label').click
  sleep 1
  find(:xpath, '//*[@id="sticky-item"]/div[4]/div[1]/div[3]/strong/span').click
  sleep 3
  expect(find("#ph-title").text).to eq("ÖN BİLGİLENDİRME FORMU")
  find("#info-terms-data-modal").find(".icon-ico_close").click

end

And(/^I read and accept distance purchase form$/) do
  find(:xpath, '//*[@id="sticky-item"]/div[4]/div[2]/div[2]/label').click
  sleep 1
  find(:xpath,'//*[@id="sticky-item"]/div[4]/div[2]/div[3]/strong/span/span' ).click
  sleep 5
  expect(find("#sales-terms-data-body").find("#ph-title").text).to eq("SATIŞ SÖZLEŞMESİ")
  find("#sales-terms-data-modal").find(".icon-ico_close").click
end

And(/^I click on complete button between basket and cart$/) do
  page.execute_script('$(".sp-advanced-css-345").remove()')
  find(".register-button.btn.w-100.btn.rounded-0.p-3.font-weight-bold.btn-black.mobile-fixed-button.mt-md-3").click
  sleep 4
end

And(/^I check size fit link$/) do
  find("#sizeTableTrigger").click
end

And(/^I check product information$/) do
  expect(page).to have_selector("#myTabContent")
  expect(page).to have_selector("#tab-1")

end

And(/^I check breadcrumb$/) do
  expect(page).to have_selector(".breadcrumb.m-0.rounded-0.bg-white")
  expect(page).to have_selector(".mb-2.detail-md.btn-cursor.position-relative")
end

And(/^I check recommendation carousels$/) do
  sleep 2
  expect(page).to have_selector("#vl-alternative-product")
end

And(/^I select price high to low sorting$/) do
  find(".d-inline-block.align-middle.form-control.rounded-0.p-1.sort-position.border-0").click
  find(".d-inline-block.align-middle.form-control.rounded-0.p-1.sort-position.border-0").all("option")[2].click

end



Then(/^I should see products are sorted price high to low$/) do
  products = all(".d-block.product-box-prices.product-box-price.pl-1.pr-2.text-site-primary")
  arr = []
  products.each{|x|
    arr << x.text.split(" ")[0]

  }
  puts arr
  arr.sort { |a,b| b <=> a}
  expect(arr).to eq(arr)

end

When(/^I select price low to high sorting$/) do
  find(".d-inline-block.align-middle.form-control.rounded-0.p-1.sort-position.border-0").click
  find(".d-inline-block.align-middle.form-control.rounded-0.p-1.sort-position.border-0").all("option")[1].click
end

Then(/^I should see products are sorted price low to high$/) do
  products = all(".d-block.product-box-prices.product-box-price.pl-1.pr-2.text-site-primary")
  arr = []
  products.each{|product|
    arr.push(product.text.split(" ")[0].to_i)
  }
  expect(arr).to eq(arr.sort)
end

And(/^I search for "([^"]*)"$/) do |arg|

  find("#small-searchterms").click
  find(".outline-0.full-search-box.ui-autocomplete-input").set arg
  find(".iconex-angle-right.align-middle.search-icon.btn-cursor").click
  sleep 1

end

And(/^I click product on checkout$/) do
  find(".img-responsive", match: :first).click
end

And(/^I should see visited product is added to basket$/) do
  expect($product_link).to eq(page.current_url)
  $product_link = nil
end

And(/^I apply size filter$/) do
  page.execute_script('$(".sp-advanced-css-345").remove()')
  first(".spec-list.p-0.no-list.my-2").all(".spec-box.text-spec.d-inline-block.text-center.border")[0].click
  sleep 1
  find("#filterByPrice").click
end

Then(/^I should see filter is applied$/) do
  expect(page).to have_content("Filtreyi Kaldır")
end

And(/^I remove applied filter$/) do
  find(:xpath, '//*[@id="filters-item"]/div/div/div[1]/ul/li[1]/ul/li[2]/a/span').click
  page.driver.browser.manage.window.resize_to(1440,900)
end

And(/^I close privacy policy message$/) do
  page.execute_script('$(".sp-advanced-css-345").remove()')


end

And(/^I click edit address button on basket$/) do
  first(".ml-2.align-middle").click
  sleep 2
end

And(/^I select shipment and billing address checkboxes$/) do
  sleep 2
  find(:xpath,'//*[@id="mCSB_1_container"]/table/tbody/tr/td[2]/div[2]/label', match: :first).click
  find(:xpath,'//*[@id="mCSB_1_container"]/table/tbody/tr/td[3]/div[2]/label', match: :first).click
end

And(/^I click on apply filter button$/) do
  page.execute_script('$(".sp-advanced-css-345").remove()')
  sleep 1
  find("#filterByPrice").click
  $price_min = find_field("priceMin").value.to_i
  $price_max = find_field("priceMax").value.to_i
  sleep 2
 # page.driver.browser.manage.window.resize_to(1440,900)

end

And(/^I click on Indirim on navigation$/) do
  find(:xpath, '//*[@id="3303"]/a/span[1]').click
end

And(/^I should see product prices are in price filter interval$/) do
  list = all(".product-box-container.p-2")
  list.each{|li|
    puts li.find(".d-block.product-box-prices.product-box-price.pl-1.pr-2.text-site-primary").text.split(" ")[0]
    li.find(".d-block.product-box-prices.product-box-price.pl-1.pr-2.text-site-primary").text.split(" ")[0].to_i.should be > $price_min
    li.find(".d-block.product-box-prices.product-box-price.pl-1.pr-2.text-site-primary").text.split(" ")[0].to_i.should be < $price_max
  }
end

And(/^I click on hamburger$/) do
  find(".mobile-menu-icon-container.position-relative.bg-white.border-0.outline-0.d-block.d-md-none").click
end

And(/^I select size variant on mobile$/) do
  page.execute_script('$(".sp-advanced-css-345").remove()')
  find(:xpath, '//*[@id="product-details-form"]/div/div[1]/div/div[2]/div/div[2]/div[1]').click
  find(".list-inline.m-0.p-0.no-list.option-list.options-swatch.options-swatch--size.options-swatch--lg.RadioList").first(".size-list-label").click

end

And(/^I add product to basket on mobile$/) do
  page.execute_script('$(".sp-advanced-css-345").remove()')
  find(".add-to-cart-button.btn.rounded-0.text-white.font-weight-bold.col-12").click
  sleep 1
end

And(/^I close information box on mobile$/) do
  sleep 2
  page.execute_script('$(".sp-advanced-css-345").remove()')
end

And(/^I delete basket items on mobile$/) do
  find(".cart-item-count.text-white.position-absolute.rounded-circle.text-center").click
  sleep 2
  find(".btn-cursor.text-site-primary",match: :first).find(".icon-ico_close").click
end


And(/^I apply size filter on mobile$/) do
  page.execute_script('$(".sp-advanced-css-345").remove()')
  find(".toggle-filter-area.d-none.text-white.text-lg-center.rounded-circle.bg-site-primary.p-2.border-0").click
  sleep 1
  find(".spec-list.p-0.no-list.my-2",match: :first).all(".spec-box.text-spec.d-inline-block.text-center.border")[0].click
  find("#filterByPrice").click
end

And(/^I click on filter button on mobile$/) do
  page.execute_script('$(".sp-advanced-css-345").remove()')
  find(".toggle-filter-area.d-none.text-white.text-lg-center.rounded-circle.bg-site-primary.p-2.border-0").click
end

And(/^I click on apply filter button on mobile$/) do
  find("#filterByPrice").click
  $price_min = find_field("priceMin").value.to_i
  $price_max = find_field("priceMax").value.to_i
end

And(/^I should see product prices are in price filter interval on mobile$/) do
  list = find(".container-fluid.product-list-container").all(".col-6.col-xs-6.col-sm-6.col-md-4.col-lg-4.col-xl-4.product-grid-item-container.p-0")
  list.each{|li|
    puts li.find(".d-block.product-box-prices.product-box-price.pl-1.pr-2.text-site-primary").text.split(" ")[0]
    li.find(".d-block.product-box-prices.product-box-price.pl-1.pr-2.text-site-primary").text.split(" ")[0].to_i.should be > $price_min
    li.find(".d-block.product-box-prices.product-box-price.pl-1.pr-2.text-site-primary").text.split(" ")[0].to_i.should be < $price_max
  }
end

  And(/^I navigate to login page on mobile$/) do
  find(".icon-ico_mini-member-on.align-middle.user-icon").click
    sleep 4
end

And(/^I navigate to addresses on mobile$/) do
  find(".icon-ico_mini-member-on.align-middle.user-icon").click
  find(".customer-menu").all("li")[1].click
end

And(/^I visit basket on mobile$/) do
  find(".cart-item-count.text-white.position-absolute.rounded-circle.text-center").click
end

And(/^I search for "([^"]*)" on mobile$/) do |arg|
  find(".outline-0.full-mobile-search-box.ui-autocomplete-input").click
  find(".outline-0.full-mobile-search-box.ui-autocomplete-input").set arg
  sleep 1
  find(".iconex-angle-right.align-middle.search-mobile-icon.btn-cursor").click


end

And(/^I click on size button on mobile$/) do
  page.execute_script('$(".sp-advanced-css-345").remove()')
  find(:xpath, '//*[@id="product-details-form"]/div/div[1]/div/div[2]/div/div[2]/div[1]').click
end

And(/^I navigate to register user page on mobile$/) do
  sleep 2
  find(:xpath, '/html/body/header/div[1]/div[1]/div/div/div/div[2]/div/ul/li[2]/a/i').click
  sleep 1
  find(:xpath, "/html/body/div[9]/div/div/div/div/div[2]/div/div[2]/form/div[5]/a/span").click
  sleep 1
end

When(/^I enter promotion code as "([^"]*)"$/) do |arg|
  find(".custom-check-label.m-0.text-secondary.discountbox-check").click
  find("#txtCouponCode").set arg
  find(:xpath, '//*[@id="bodyDiscountBox"]/div[3]/div[2]/input').click
  sleep 2
end

And(/^I should see discount applied message$/) do
  txt = find(".text-white.text-center.p-2.rounded.coupon-code-result.bg-success").text
  expect(txt).to match("İndirim kodu uygulandı.")
  expect(page).to have_selector(:xpath,'//*[@id="bodyCartTotals"]/table/tbody/tr[3]/td[1]/button/i')
  expect(page).to have_selector(:xpath,'//*[@id="bodyDiscountBox"]/div[4]/div/ul/li/small/div/button/i')
  #expect(find(:xpath, '//*[@id="bodyCartTotals"]/table/tbody/tr[3]/td[3]').text).to include("40")
end

And(/^I cancel promotion code$/) do
  find(:xpath,'//*[@id="bodyCartTotals"]/table/tbody/tr[3]/td[1]/button/i').click
end

And(/^I click on Yargıcı on footer$/) do
  find(:xpath, '/html/body/footer/div[2]/div/div[1]/div/div/div/div[1]/div/div').click
end

And(/^I click on Yardım on footer$/) do
  find(:xpath, '/html/body/footer/div[2]/div/div[1]/div/div/div/div[2]/div/div').click
end

And(/^I click on Kategoriler on footer$/) do
  find(:xpath,'/html/body/footer/div[2]/div/div[1]/div/div/div/div[3]/div/div').click
  page.execute_script('$(".sp-advanced-css-345").remove()')

end

Given(/^I delete all adresses$/) do
  i = 0
  while i< 500
    visit 'https://www.yargici.com/customer/addresses'
    sleep 1
    find(".btn.bg-white.account-address-button.account-address-remove.border-bottom.w-100.text-left", match: :first).click
    #find(".btn.bg-white.account-address-button.account-address-remove.border-bottom.w-100.text-left", match: :first).click
    page.driver.browser.switch_to.alert.accept
    sleep 5
    i = i+1
  end
end



Given(/^I get$/) do
  visit 'https://www.drlinkcheck.com/account/login'
  find('#email').set('oytunerdogan@gmail.com')
  find('#password').set('12345678')
  find('.btn.btn-primary.btn-block').click
  sleep 2
  find("#sidebar-project-dropdown").click
  find(:xpath, '//*[@id="app"]/div/div[3]/div/div[3]/div[2]/div/a/div[2]/div').click
  sleep 2
  find(:xpath, '//*[@id="app"]/div/div[1]/div/div[1]/div/ul/li[2]/a').click

  sleep 2

  stat = true
  while stat
    a = all(".link-url")
    a.each { |x| puts x.text }
    puts " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    b = all(".small.link-details.url-container")
    b.each{|x| puts x.text.split(" ")[2]}
    puts " AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"


    if page.has_xpath?('//*[@id="app"]/div/div[3]/div/div[2]/div[2]/div/div[3]/ul/li[2]/a')
      find(:xpath, '//*[@id="app"]/div/div[3]/div/div[2]/div[2]/div/div[3]/ul/li[2]/a').click
      sleep 2
    end
  end
end