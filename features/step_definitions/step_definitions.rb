#encoding: UTF-8

Given(/^I visit the Deal homepage$/) do
  visit 'https://thedealoutlet.com/'
  expect(page).to have_selector('.LinkMenuItem')
  puts "Visiting Deal Outlet"
  puts current_url
end

And(/^I visit the first product detail page$/) do
  sleep 5
  puts "Visiting product detail page"
  products = all(".product-box-image-container")
  products[0].click
  sleep 2
end

And(/^I navigate to women category$/) do
  begin
    navigation_items = find(".MainMenu.main-menu.no-list.p-0.m-0.list-inline.text-center.w-100").all("li")
    navigation_items[1].click
  rescue
    puts "Could not be redirected to category"
  end
end


And(/^I click add to basket$/) do
  find(".add-to-cart-button").click
  sleep 2
end

Then(/^I should see error message "([^"]*)"$/) do |arg|
  expect(find(".ajax-cart-error-text.text-center").text).to match(arg)
  puts "Information box displayed"
end

And(/^I close information box$/) do
  find(".modal.fade.show",match: :first).find(".close").click
  puts "Closing information box"
  sleep 2
end

And(/^I select size$/) do
  find(".size-list-label:not(.attribute-value-out-of-stock)", match: :first).click
end

Then(/^I should see mini cart appears with product added$/) do
  expect(page).to have_selector("#mini-cart")
end

When(/^I click on view full bag$/) do
  find(".flyout-buttons.btn.btn-site-black.float-left").click
  sleep 2
end

And(/^I should be redirected to "([^"]*)"$/) do |arg|
  sleep 2
  expect(page.current_url).to include(arg)
  puts "Visiting #{page.current_url}"
end

Then(/^I click on Confirm button on checkout$/) do
  find("#checkout").click
  puts "Clicking on Confirm button"
end

And(/^I click on Checkout as Guest$/) do
  find(".btn.btn-outline-site-black.checkout-as-guest-button.w-100").click
end

Then(/^I enter mail address "([^"]*)"$/) do |arg|
  find_by_id('customerEmail').set arg
  find("#saveEmail").click
  expect(page).to have_selector(".col-12.col-md-8.change-email-form.d-none")
end


And(/^I enter "([^"]*)" as "([^"]*)"$/) do |arg1, arg2|
  find(arg1).set arg2
end

And(/^I select UAE on dropdown$/) do
  find("#countryName option[value='79']").select_option
end

And(/^I select Dubai on dropdown$/) do
  find("#cityName option[value='238']").select_option
end

And(/^I enter delivery address "([^"]*)"$/) do |arg|
  find("#addressLine").set arg
end

And(/^I should see "([^"]*)" part is disabled$/) do |arg|
  expect(page).to have_selector(arg, :true)

end

And(/^I save address$/) do
  find("#addNewAddress").click
  puts "Address Saved"
end

And(/^I enter credit card information$/) do |table|
  table = table.raw[0]
  # table is a table.hashes.keys # => [:1212 1212 1221 1212, :12, :21, :123]
  sleep 15
 # find("input[data-checkout='card-number']").set table[0]
  page.within_frame('cko-iframe-id') do
    all(".input-control")[0].set(table[0])
    all(".input-control")[1].set(table[1])
    all(".input-control")[2].set(table[2])
    sleep 5
    all(".input-control")[3].click
    all(".input-control")[3].set("123")
  end

end

Then(/^I click on place my order button$/) do
  find(".payment-info-next-step-button").click
end

Then(/^I see navigation bar exists$/) do
  expect(page).to have_selector(".MainMenu.main-menu.no-list.p-0.m-0.list-inline.text-center.w-100")
  puts "Navigation bar found"
end

And(/^I see search bar exists$/) do
  expect(page).to have_selector("#small-searchterms")
  puts "Search bar found"
end

And(/^I see breadcrumb exists$/) do
  home_page_breadcrumb = find(".breadcrumb.m-0.rounded-0.bg-white").all(".breadcrumb-item")
  expect(page).to have_link('Anasayfa', href:"/" )
end

And(/^I see product information box exists$/) do
  expect(page).to have_content("PRODUCT INFORMATION")
end

And(/^I see add to favourites button exists$/) do
  expect(page).to have_selector(".add-to-favourites.btn-cursor")
end

And(/^I see share button exists$/) do
  expect(page).to have_selector(".fas.fa-share-alt")
end

And(/^I see footer bar exists$/) do
  find(".footer-list-menu.list-inline.m-0.p-0.text-center").all(".d-block.d-md-inline-block")
  expect(page).to have_selector(".footer-list-menu.list-inline.m-0.p-0.text-center")
  puts "Found footer"
end

And(/^I see account items exists$/) do
  expect(page).to have_selector(".ajax-header-container.d-inline-block.align-middle.float-right")
end

And(/^I navigate to login page$/) do
 account = find(".user-action-list.user-action-list.d-inline-block.align-middle.m-0.p-0").find(".d-inline-block.align-middle.customer-list-item")
  account.click
end

And(/^I click create an account button$/) do
  find(:xpath, "/html/body/div[7]/div/div/div/div[1]/div/div/div/div/div[2]/a").click
end

And(/^I select date on option dropdown$/) do
  find("select[name='DateOfBirthDay'] option[value='1']").select_option
end

And(/^I select month on option dropdown$/) do
  find("select[name='DateOfBirthMonth'] option[value='1']").select_option
end

And(/^I generate email with date time$/) do
  time = Time.new
  puts time.year + time.month + time.day + time.usec
  find("#Email").set time.year.to_s + time.month.to_s + time.day.to_s + time.usec.to_s + "@gmail.com"
end

And(/^I select year on option dropdown$/) do
  find("select[name='DateOfBirthYear'] option[value='1994']").select_option
end

And(/^I click on register button$/) do
  find("#register-button").click
end

Then(/^I should see account activation message$/) do
  acc = find(".static-page-header.text-center").text
  expect(acc).to match("Account Activations")
  expect(page).to have_selector(".login-button.btn.btn-site-green.w-100")
end

And(/^I click login button$/) do
  find(".login-button.btn.btn-site-green.w-100").click
end

And(/^I see transaction is aborted message$/) do
  text = find("#checkout-confirm-order-load").text
  sleep 10
  expect(text).to include("The transaction has aborted.")
end

And(/^I click on "([^"]*)" filter combobox$/) do |arg|
  find(".bg-white.filter-left-menu.common-mobile-menu").find(".filter-container.d-md-flex.justify-content-between.flex-nowrap").find(".filter-item."+arg).click
end

And(/^I select dresses on combobox$/) do
  list  = find(".bg-white.filter-left-menu.common-mobile-menu").find(".filter-container.d-md-flex.justify-content-between.flex-nowrap").find(".filter-item.cats").find('a[href="/c/dresses-26"]')
  list.click
end

And(/^I select size on combobox$/) do
  find(".filter-item.size").find(".spec-list.p-0.m-0.no-list.size.scroll-class").all("li")[0].click
end

Then(/^I should see selected filters$/) do
  expect(page).to have_link("Remove Filter")
  expect(page).to have_selector(".remove-filtered-spec.text-white.position-relative.d-block")
  expect(page).to have_selector(".spec-box.text-spec.d-inline-block.ease.text-left.active.selected-spec")
end

Then(/^I select color on combobox$/) do
  find(".filter-item.color").find(".spec-list.p-0.m-0.no-list.color").all("li")[0].click
end

And(/^I select brand on combobox$/) do
  find(".filter-item.brand").find(".spec-list.p-0.m-0.no-list.brand").all("li")[0].click
end

And(/^I see products are listed$/) do
  number_of_product = find(".product-counts-info-row.position-absolute.d-none.d-md-block", match: :first).text
  number_of_product.split(" ")[0].to_i.should be > 0
end

And(/^I select price low to high$/) do
  find(".filter-item.order-by", match: :first).find(".spec-list.sort-list.m-0.p-0.no-list").all("li")[3].click
end

Then(/^I should see products are sorted price low to high$/) do
  prices = find(".container-fluid.product-list-container.p-0").all(".product-price-list.list-inline.text-left.p-0")
  arr = []
  prices.each{|x|
    arr << x.find(".d-block.product-box-price").text.split(" ")[0]

  }
  puts arr
  expect(arr).to eq(arr.sort)
end

And(/^I select price high to low$/) do
  find(".filter-item.order-by", match: :first).find(".spec-list.sort-list.m-0.p-0.no-list").all("li")[4].click
end


Then(/^I should see products are sorted price high to low$/) do
  prices = find(".container-fluid.product-list-container.p-0").all(".product-price-list.list-inline.text-left.p-0")
  arr = []
  prices.each{|x|
    arr << x.find(".d-block.product-box-price").text.split(" ")[0]

  }

  arr.sort { |a,b| b <=> a}
  puts arr
  expect(arr).to eq(arr)


end

Then(/^I click forgot password$/) do
  find(".d-inline-block.text-site-light-gray").click
end

And(/^I click reset my password button$/) do
  find(".btn.btn-site-green.w-100").click
end

Then(/^I should see password recovery email is sent message$/) do
  expect(find(".font-italic.rounded.p-2.mb-2.in-no-list.bg-success.text-white").text).to match("Your password change information has been sent to your e-mail address.")
end

When(/^I click on add to favorites button$/) do
  find(".far.fa-heart").click
end

Then(/^I should see product is added to favorites$/) do
  expect(find(".favorite-result-message").text).to include("Related product has been added to your favorite list. You can access your favorite list from the ")

end

And(/^I close favorite product added information box$/) do
  sleep 2
  find("#add-to-favorites-modal").find('span',  :text => "Close").click

end

Then(/^I should see "([^"]*)" on heart logo$/) do |arg|
  sleep 2
  expect(find(:xpath,"/html/body/header/div[2]/div/div/div/div/div[2]/ul/li[2]/a/span").text).to match(arg)
end

And(/^I navigate to favorites page$/) do
  visit 'https://thedealoutlet.com/customer/favouritesubscriptions'
end

Then(/^I should see favorite products is not empty$/) do
  expect(page).to have_selector(".favourite-table")
end


When(/^I click on edit button$/) do
  find(".add-to-cart-from-fav.bg-white.border-0").click
  sleep 2
  expect(page).to have_selector("#product-details-form")
  sleep 2
end

And(/^I search for product "([^"]*)"$/) do |arg|
  find("#small-searchterms").set(arg)
  find("#search-submit").click
  sleep 2
  expect(page.current_url).to include(arg.gsub(' ', '+'))
end

And(/^I should see "([^"]*)" product is added to basket$/) do |arg|
  product_name = all(".mini-cart-product-name")[1].text
  expect(product_name).to match(arg)
end

Then(/^I check footer links$/) do |table|
  # table is a table.hashes.keys # => [:PRIVACY & COOKIES POLICY]
  table = table.raw[0]
  sleep 2
  footer = find(".footer-list-menu.list-inline.m-0.p-0.text-center").all("li")
  expect(footer[0].text).to eq(table[0])
  expect(footer[1].text).to eq(table[1])
  expect(footer[2].text).to eq(table[2])
  expect(footer[3].text).to eq(table[3])
end

When(/^I click on "([^"]*)" on footer$/) do |arg|
  footer = find(".footer-list-menu.list-inline.m-0.p-0.text-center")
  footer.find("a", :text => arg, match: :first).click
end

And(/^I click on my addresses button$/) do
  find(".customer-menu.customer-menu-action.d-block.bg-white.border-0").hover
    find(".customer-menu.customer-logged-menu.no-list.m-0.p-0.border.rounded.arrow_box").all("li")[1].click
end

And(/^I click add new address button$/) do
  find(".btn.btn-site-green.w-100.mt-md-5").click
  sleep 2
end

And(/^I click save button$/) do
  find(".btn.btn-site-green.w-100").click
end

When(/^I click on edit button for addresses$/) do
  find(".btn-btn-site-black-w-100", match: :first).click
end

And(/^I logout$/) do
  find(:xpath, "/html/body/header/div[2]/div/div/div/div/div[2]/ul/li[3]/button/img").hover
  acc = find(:xpath,"/html/body/header/div[2]/div/div/div/div/div[2]/ul/li[3]/div/ul/li[4]/a/span")
  acc.click
end

Then(/^I delete address$/) do
  find(".address-edit-button.d-none.d-md-block.bg-white.border-0.w-100.h-100", match: :first).click
  sleep 1
  page.driver.browser.switch_to.alert.accept
end