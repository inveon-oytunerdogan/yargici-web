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
  find(".d-inline-block.align-middle.customer-list-item").hover
  acc = find(".customer-menu.customer-logged-menu.no-list.m-0.p-0.border.rounded.arrow_box").find(:css, 'a[href="/logout"]')
  acc.click
end