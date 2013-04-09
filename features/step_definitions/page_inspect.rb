Then /^(\d+)\. I should (not )*see text "(.*)"$/ do |i, should_not, text|
  text_present = page.has_xpath?('//*', :text => text)
  if should_not.nil? ? !text_present : text_present
    raise OnlineTestingError, "#{ should_not.nil? ? "Cant find" : :"There's shouldn't be" } text '#{text}' on the page", i
  end
end

Then /^(\d+)\. I should see (.+) on the page$/ do |i, tag|
  unless page.has_css?("#{tag}")
    raise OnlineTestingError, "Can't find #{tag} on the page", i
  end
end

Then /^(\d+)\. I should see (.+) with (.+) "(.*)"$/ do |i, tag, attribute, name|
  unless page.has_css?("#{tag}[#{attribute}='#{name}']")
    raise OnlineTestingError, "Can't find #{tag} with '#{attribute}' '#{name}' on the page", i
  end
end

Then /^(\d+)\. I should see in (.+) text "(.*)"$/ do |i, tag, text|
  unless page.has_xpath?(".//#{tag}", :text => text)
    raise OnlineTestingError, "Can't find #{tag} with text '#{text}' on the page", i
  end
end


And /^(\d+)\. I should see table '(.+)' with (\d+) rows$/ do |i, selector, rows|
  table = first(selector)
  if table.all('tr').count != rows.to_i
    raise OnlineTestingError, "Table #{selector} should have #{rows} rows", i
  end
end

And /^(\d+)\. I should see table '(.+)' with (\d+) columns$/ do |i, selector, cols|
  table = first(selector)
  if table.nil?
    raise OnlineTestingError, "Can't find table '#{selector}' on listing products page.", i
  elsif table.first('tr').all('td').count != cols.to_i
    raise OnlineTestingError, "Table #{selector} should have #{cols} columns", i
  end
end

And /^(\d+)\. The (\d+)\w* column of table '(.+)' should contain '(.*)'$/ do |i, col_idx, selector, content_selector|
  table = first(selector)
  column_cells = table.all('tr').collect{ |r| r.all('td')[col_idx.to_i-1] }
  column_cells.each_with_index do |c, idx|
    unless c.has_css?(content_selector)
      raise OnlineTestingError, "There is no #{content_selector} in the #{col_idx} column of the table #{selector} at row #{idx}", i
    end
    idx
  end
end

And /^(\d+)\. The (\d+)\w* column of table '(.+)' should contain text matching pattern (\/.*\/)$/ do |i, col_idx, selector, text_pattern|
  table = first(selector)
  column_cells = table.all('tr').collect{ |r| r.all('td')[col_idx.to_i-1] }
  column_cells.each_with_index do |c, idx|
    unless c.text.match(eval(text_pattern))
      raise OnlineTestingError, "Text in the #{col_idx} column of the table #{selector} at row #{idx} didn't match pattern #{text_pattern}", i
    end
    idx
  end
end
