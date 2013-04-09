Then /^(\d+)\. Class "(.*)" should be inherited from "(.*)"$/ do |i, class_name, superclass_name|
  cl = class_name.constantize
  begin
    scl = superclass_name.constantize
  rescue NameError
    raise OnlineTestingError, "There is no class '#{superclass_name}' - parent for '#{class_name}'"
  end
  until cl.superclass.nil?
    cl = cl.superclass
    y = true if cl == scl
  end
  unless y |= false
    raise OnlineTestingError, "Class '#{class_name}' should have '#{superclass_name}' in its inheritance chain", i
  end
end

Then /^(\d+)\. There should be class "(.*)" in the project$/ do |i, class_name|
  begin
    class_name.constantize
  rescue NameError
    raise OnlineTestingError, "There is no class '#{class_name}' in the project", i
  end
end


#############


And /^(\d+)\. class "(\w+)" belongs to the class "(\w+)"$/ do |i, child_class_name, parent_class_name|
  child = child_class_name.constantize
  unless child.new.respond_to? parent_class_name.underscore
    raise OnlineTestingError, "Class \"#{child_class_name}\" should belongs to \"#{parent_class_name}\"", i
  end
end

Then /^(\d+)\. Post should have comments/ do |i|
  unless Post.new().respond_to?(:comments)
    raise OnlineTestingError, "Post do not have comments", i
  end
end

Then /^(\d+)\. Comment should have post/ do |i|
  unless Comment.new().respond_to?(:post)
    raise OnlineTestingError, "Comment do not have post", i
  end
end
