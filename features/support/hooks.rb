#encoding: UTF-8
After do |scenario|
  if scenario.failed?
    p "scenario failed"
  end
end

Before('@first') do |scenario|
  p "#{scenario.name} starting"
end

Around('@testhive') do |scenario, block|
  p 'testhive starting'
  block.call
  p 'testhive ending'
end

Before('@setup') do
  $search_term = 'alpler'
end

After('@teardown') do
  $search_term = nil
end

After('@log_out') do
  visit 'https://thedealoutlet.com/'
  sleep 2
  #find(".d-inline-block.align-middle.customer-list-item").hover
  find(:xpath, "/html/body/header/div[2]/div/div/div/div/div[2]/ul/li[3]/button/img").hover
  #find(".d-inline-block.align-middle.customer-list-item").find(".customer-menu.customer-menu-action.d-block.bg-white.border-0").hover
  sleep 1
  find(:xpath, "/html/body/header/div[2]/div/div/div/div/div[2]/ul/li[3]/div/ul/li[4]/a/span").click

end

After('@mobile_log_out') do
  visit 'https://thedealoutlet.com/'
  sleep 2
  #find(".d-inline-block.align-middle.customer-list-item").hover
  find(:xpath, "/html/body/header/div[2]/div/div/div/div/div[2]/ul/li[3]/button/img").click
  #find(".d-inline-block.align-middle.customer-list-item").find(".customer-menu.customer-menu-action.d-block.bg-white.border-0").hover
  sleep 1
  find(:xpath, "/html/body/header/div[2]/div/div/div/div/div[2]/ul/li[3]/div/ul/li[4]/a/span").click

end

After('@clear_basket') do
  visit 'https://thedealoutlet.com/'
  find("#mobile-cart-trigger").click
  find(".delete-shopping-cart-item-icon.position-absolute.border-0.bg-white.p-0", match: :first).click
  find(".btn-remove-item.btn-cart-item-actions.btn.btn-site-green.float-right.p-2.text-white.border-0", match: :first).click
end

After('@clear_favorites') do
  visit 'https://thedealoutlet.com/customer/favouritesubscriptions'
  find("button.delete-favourite-subscription.bg-white.border-0.w-100.h-100", match: :first).click
  page.driver.browser.switch_to.alert.accept
end

After('@mobile_clear_favorites') do
  visit 'https://thedealoutlet.com/customer/favouritesubscriptions'
  sleep 1
  find(".delete-favourite-subscription.mobile-delete-fav.bg-white.border-0.d-md-none.p-0", match: :first).click
  page.driver.browser.switch_to.alert.accept
end


Before('@mobile') do
  page.driver.browser.manage.window.resize_to(375,667)
end


Before('@desktop') do
  page.driver.browser.manage.window.resize_to(1440,900)
end