Feature: Admin tag list
  So that I can edit tags
  As an authenticated user
  I want to see a tag list

  @dev
  Scenario: Show the title of the tag
    Given a tag with name "Importante" and color "Rojo"
    When I go to admin tags
    Then I should see "Importante"