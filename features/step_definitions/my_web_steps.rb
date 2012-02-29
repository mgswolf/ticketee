Given /^I am on the homepage$/ do
  visit root_path
end

When /^I follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should be on the project page for "([^"]*)"$/ do |name|
  current_path = URI.parse(current_url).path
  current_path.should == project_path(Project.find_by_name!(name))
end


Then /^I should not see "([^"]*)"$/ do |text|
  page.should have_no_content(text)
end

When /^I check "([^"]*)"$/ do |field|
  check(field)
end

When /^I attach the file "([^"]*)" to "([^"]*)"$/ do |path, field|
  attach_file(field, File.expand_path(path))
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I should see "([^"]*)" within "([^"]*)"$/ do |text, selector|
  within(selector) do           # Did search WITHIN selector, I tried
    page.should have_content(text)
  end
end

When /^I follow "([^"]*)" within "([^"]*)"$/ do |link, selector|
  within(selector) do
    click_link(link)
  end
end

When /^I select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end