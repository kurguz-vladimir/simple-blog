Given /^(\d+)\. We have a project$/ do |i|
end

Given /^Such posts saved in database$/ do |table|
  table.rows.each do |row|
    attr_keys = table.column_names
    attrs_hash = {}
    row.each_with_index { |attr_val, i| attrs_hash[attr_keys[i]] = attr_val }
    Post.create(attrs_hash)
  end
end

Given /^Such comments saved in database$/ do |table|
  table.rows.each do |row|
    attr_keys = table.column_names
    attrs_hash = {}
    row.each_with_index { |attr_val, i| attrs_hash[attr_keys[i]] = attr_val }
    Comment.create(attrs_hash)
  end
end
