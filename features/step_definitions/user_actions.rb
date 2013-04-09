When /^(\d+)\. I fill in "(.+)" with value "(.*)"$/ do |i, locator, value|
  field = page.first(:fillable_field, locator)
  raise(OnlineTestingError, "Can't find field with name '#{locator}'", i) if field.nil?
  field.set(value)
end

When /^(\d+)\. I press "(.+)"$/ do |i, locator|
  button = find(:button, locator)
  raise(OnlineTestingError, "Can't find button '#{button}'") if button.nil?
  button.click
end

When /^(\d+)\. I follow '(.*)' in '(.+)' with text "(.*)"$/ do |i, link_name, container, container_text|
  begin
    first(container, :text => container_text).first('a', :text => link_name).click
  rescue
    raise OnlineTestingError, "Unable to find link #{link_name} near #{container_text}", i
  end
end

Then /^(\d+)\. I follow link (.*)$/ do |i, link_name|
  begin
    first('a', :text => link_name).click
  rescue
    raise OnlineTestingError, "Unable to find link #{link_name}", i
  end
end
