Feature: Database

  Scenario: Check the DB
  We should have table named "posts" in DB with appropriate columns and column types
    Given 1. We have a project
    Then 2. There should be table named "posts" in the DB
    And 3. Table "posts" should have such rows:
      |title |
      |text  |
    And 4. Rows in "posts" table should have such types:
      |title |string |
      |text  |text  |
