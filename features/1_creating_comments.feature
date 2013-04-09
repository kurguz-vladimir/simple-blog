Feature: Creating Comments

  Scenario: Adding Comments
    Given 1. We have a project
    Then 2. There should be table named "comments" in the DB
    And 3. Table "comments" should have such rows:
      |post_id |
      |text    |
    And 4. Rows in "comments" table should have such types:
      |post_id |integer |
      |text    |text  |
    And 5. There should be class "Comment" in the project
    And 5. Class "Comment" should be inherited from "ActiveRecord::Base"
    And 6. There should be class "CommentsController" in the project
    And 6. Class "CommentsController" should be inherited from "ApplicationController"

  Scenario: Relations
  Adding a Relations Between Post and Comment
    Given 1. We have a project
    Then 1. Post should have comments
    And 2. Comment should have post

  Scenario: Check CRUID for CommentsController
  All the create and destroy methods in CommentsController should respond to requests
    Given Such posts saved in database
      |title |text        |
      |post1 |post 1 text |
    Given Such comments saved in database
      |post_id |text                |
      |1       |post1 comment1 text |
    Then 2. POST "/posts/1/comments" should respond without errors
    And 2. DELETE "/posts/1/comments/1" should respond without errors

  Scenario: List of Comments
  Adding a List of Comments to the Post Page
    Given Such posts saved in database
      |title |text        |
      |post1 |post 1 text |
    Given Such comments saved in database
      |post_id |text                |
      |1       |post1 comment1 text |
    When 1. I go to the last post page
    Then 2. I should see in h2 text "Comments"
    And 2. I should see in p text "post1 comment1 text"

  Scenario: Add Comment to the Post
  Add a CommentForm to the Post Page and writing Comments Controller's Create Action
    Given Such posts saved in database
      |title |text        |
      |post1 |post 1 text |
    When 1. I go to the last post page
    Then 2. I should see textarea with name "comment[text]"
    And 3. I fill in "comment[text]" with value "post1 comment2 text"
    And 4. I press "Post comment"
    Then 5. I should be redirected to the last post page
    And 6. I should see in p text "post1 comment2 text"

  Scenario: Delete Comment
  Add a Delete Link to Comment and writing Comments Controller's Destroy Action
    Given Such posts saved in database
      |title |text        |
      |post1 |post 1 text |
    Given Such comments saved in database
      |post_id |text                |
      |1       |post1 comment1 text |
    When 1. I go to the last post page
    Then 2. I should see a with href "/posts/1/comments/1"
    And 2. I should see in a text "Delete comment"
    And 2. I should see a with data-confirm "Sure?"
    And 2. I should see a with data-method "delete"
    Then 3. I follow link Delete comment
    And 4. I should be redirected to the last post page
    And 5. I should not see text "post1 comment1 text"

