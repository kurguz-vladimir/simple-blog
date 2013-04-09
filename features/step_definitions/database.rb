Then /^(\d+)\. There should be table named "(.*)" in the DB$/ do |i, table_name|
  unless ActiveRecord::Base.connection.table_exists? table_name
    raise OnlineTestingError, "Can't find table with name '#{table_name}' in the database", i#ErrorHints.get("Database", "Check the DB", 1)
  end
end

Then /^(\d+)\. Table "(.*)" should have such rows:$/ do |i, table_name, matrix|
  matrix.cell_matrix.each do |row|
    unless ActiveRecord::Base.connection.column_exists?(table_name, row[0].value)
      raise OnlineTestingError, "There is no column with name '#{row[0].value}' in '#{table_name}' table", i
    end
  end
end

Then /^(\d+)\. Rows in "(.*)" table should have such types:$/ do |i, table_name, matrix|
  table_rows = ActiveRecord::Base.connection.columns(table_name).inject({}){ |h, row| h[row.name] = row.type.to_s; h }
  matrix.cell_matrix.each do |matrix_row|
    unless table_rows[matrix_row[0].value] == matrix_row[1].value
      raise OnlineTestingError, "Column '#{matrix_row[0].value}' in '#{table_name}' should be #{matrix_row[1].value}, but was #{table_rows[matrix_row[0].value]}", i
    end
  end
end
