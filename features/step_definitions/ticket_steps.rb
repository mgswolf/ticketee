Given /^"([^"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(:user => User.find_by_email!(email))
    @project.tickets.create!(attributes)
  end
end


Then /^I should see "([^"]*)" within "([^"]*)"$/ do |text, selector|
  within(selector) do           # Did search WITHIN selector, I tried
    page.should have_content(text)
  end
end

