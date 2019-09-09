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
  find(:xpath, "/html/body/header/div[2]/div/div/div/div/div[2]/ul/li[3]").hover
  #find(".d-inline-block.align-middle.customer-list-item").find(".customer-menu.customer-menu-action.d-block.bg-white.border-0").hover
  acc = find(".customer-menu.customer-logged-menu.no-list.m-0.p-0.border.rounded.arrow_box").find(:css, 'a[href="/logout"]')
  acc.click
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