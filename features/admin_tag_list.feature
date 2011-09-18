Feature: Admin tag list
  So that I can edit tags
  As an authenticated user
  I want to see a tag list

  Scenario: Show the title of the tag
    Given a tag with name "Importante" and color "Rojo"
    When I go to admin tags
    Then I should see "Importante"

  @dev
  # Raro: un bug? que no puedo resolver
  Scenario: Tags should be in order
    Given a tag with name "Uno" and color "Rojo"
    And a tag with name "Dos" and color "Verde"
    And a tag with name "Tres" and color "Azul"
    When I go to admin tags
    Then I should see "1"
    And I should see "2"
    And I should see "3"