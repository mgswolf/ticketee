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

Given /^there is a project called "([^"]*)"$/ do |name|
  Factory(:project, :name => name)
end
