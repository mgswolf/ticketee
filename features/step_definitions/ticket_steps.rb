Given /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end

Then /^I should see "([^"]*)" within "([^"]*)"$/ do |text, selector|
  within(selector) do           # Did search WITHIN selector, I tried
    page.should have_content(text)
  end
end
