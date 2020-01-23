#encoding: UTF-8
After do |scenario|
  if scenario.failed?
    p "scenario failed"
  end
end

Before('@first') do |scenario|
  p "#{scenario.name} starting"
end

After('@log_out') do
  visit 'https://www.yargici.com/'
  sleep 2
  all(".d-inline-block.align-middle.customer-list-item.mr-md-1")[1].hover
  find(".customer-menu.customer-logged-menu.text-left.no-list.m-0.p-0").all("li")[3].find("[href='/logout']").click
end

After('@clear_favourites') do
  visit 'https://www.yargici.com/customer/favouritesubscriptions'
  sleep 5
  find(".delete-favourite-subscription").click
  page.driver.browser.switch_to.alert.accept

end

After('@clear_basket') do
  visit 'https://www.yargici.com/cart'
  sleep 2
  find(:xpath, '//*[@id="bodyCart"]/tr[2]/td[3]/table/tbody/tr/td[2]/table/tbody/tr/td[2]/span/i').click
  #find(".delete-shopping-cart-item-icon.border-0.text-site-primary.outline-0").find(".icon-ico_close").click
  find("#modal-btn-si").click


end


Before('@mobile') do
  page.driver.browser.manage.window.resize_to(414,736)
end

Before('@desktop') do
  page.driver.browser.manage.window.resize_to(1440,900)
end


After('@clear_addresses') do
  visit 'https://www.yargici.com/customer/addresses'
  sleep 2
  all(".ml-2.align-middle")[1].click
  page.driver.browser.switch_to.alert.accept
end

After('@log_out_mobile') do
  visit 'https://www.yargici.com/'
  sleep 2
  find(".icon-ico_mini-member-on.align-middle.user-icon").click
  find(".customer-menu").all("li")[3].click
end


After('@clear_basket_mobile') do
  visit 'https://www.yargici.com/cart'
  sleep 2
  find(:xpath,'//*[@id="bodyCart"]/tr[1]/td/h5/span[2]/i').click
  find("#modal-btn-si").click
end


After('@delete_address') do
  visit 'https://www.yargici.com/customer/addresses'
  sleep 2
  find(".btn.bg-white.account-address-button.account-address-remove.border-bottom.w-100.text-left", match: :first).click
  page.driver.browser.switch_to.alert.accept

end

Before('@mobile') do
  Capybara.current_driver = :chrome414x736
end