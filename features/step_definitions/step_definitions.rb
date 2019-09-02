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
  products[1].click
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
  find(".modal.fade.show").find(".close").click
  puts "Closing information box"
  sleep 2
end

And(/^I select size$/) do
  find(".size-list-label", match: :first).click
end

Then(/^I should see mini cart appears with product added$/) do
  expect(page).to have_selector("#mini-cart")
end

When(/^I click on view full bag$/) do
  find(".flyout-buttons.btn.btn-site-black.float-left").click
  sleep 2
end

And(/^I should be redirected to "([^"]*)"$/) do |arg|
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