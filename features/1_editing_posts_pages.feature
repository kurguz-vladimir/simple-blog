Feature: EditingPostsPages

  Scenario: Listing posts
  We should be able to view a list of posts
    Given Such posts saved in database
      |title |text        |
      |post1 |post 1 text, post 1 text, post 1 text, post 1 text, post 1 text, post 1 text, post 1 text, post 1 text |
      |post2 |post 2 text |
      |post3 |post 3 text |
    When 1. I go to the posts page
    Then 2. I should see in h1 text "Welcome to My Blog"
    And 2. I should see in h2/a text "post1"
    And 2. I should see in p text "post 1 text, post 1 text, p..."

  Scenario: Show post
  We should be able to view a post
    Given Such posts saved in database
      |title |text        |
      |post1 |post 1 text |
    When 1. I go to the last post page
    Then 2. I should see in h1 text "post1"
    And 2. I should see in a text "Back"
    And 2. I should see in a text "Edit"
    And 2. I should see in a text "Delete"
    And 2. I should see a with href "/posts/1"
    And 2. I should see a with data-confirm "Are You sure?"
    And 2. I should see a with data-method "delete"
    Then 3. I follow link Delete
    And 4. I should be redirected to the posts page
    And 5. I should not see text "post1"

  Scenario: Edit post form
  We should be able to view a edit post form
    Given Such posts saved in database
      |title |text        |
      |post1 |post 1 text |
    When 1. I go to the edit last post page
    Then 2. I should see textarea with rows "6"
