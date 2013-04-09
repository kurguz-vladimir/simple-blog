Feature: Post Scaffold

  Scenario: Check the Post Model
  We should have model Post
    Given 1. We have a project
    Then 2. There should be class "Post" in the project
    And 2. Class "Post" should be inherited from "ActiveRecord::Base"

  Scenario: Check the PostsController
  We should have controller for Posts
    Given 1. We have a project
    Then 2. There should be class "PostsController" in the project
    And 2. Class "PostsController" should be inherited from "ApplicationController"

  Scenario: Check CRUID for PostsController
  All the new, create, show, edit, update, index and destroy methods in PostsController should respond to requests
    Given 1. We have a project
    Then 2. GET "/posts/new" should respond without errors
    And 2. POST "/posts" should respond without errors
    And 2. GET "/posts/1" should respond without errors
    And 2. GET "/posts/1/edit" should respond without errors
    And 2. PUT "/posts/1" should respond without errors
    And 2. GET "/posts" should respond without errors
    And 2. DELETE "/posts/1" should respond without errors
