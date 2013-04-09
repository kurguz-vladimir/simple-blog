Then /^(\d+)\. (\w+) "([^\"]*)" should respond without errors$/ do |i, method, path|
  begin
    page.driver.send(method.downcase, path)
  rescue Exception => e
    raise OnlineTestingError, "#{method} '#{path}' responds with error '#{e}'", i
  end
end

Given /^(\d+)\. I am on (.+)$/ do |i, page_name|
  go_to page_name, i
end

When /^(\d+)\. I go to (.+)$/ do |i, page_name|
  go_to page_name, i
end

def go_to page_name, step_index=nil
  begin
    path = path_to(page_name)
    visit path
  rescue
    raise OnlineTestingError, "Can't find path \"#{path}\" or this page have error", step_index
  end
end

Then /^(\d+)\. I should be redirected to (.+)$/ do |i, page|
  if current_path != path_to(page)
    raise OnlineTestingError, "User should be redirected to #{page}"
  end
end
