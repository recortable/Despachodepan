Feature: Admin card summaries
  So that I can edit cards
  As an authenticated user
  I want to see card summaries

  Scenario: Show the title of the cards
    Given a card with title "Anything"
    When I go to admin cards
    Then I should see "Anything"

  Scenario: Show the tags of the cards
    Given a tag with name "Important" and color "red"
    And a card with title "Tagged"
    And I add the tag "Important" to the card "Tagged"
    When I go to admin cards
    Then I should see "Important"

  @dev
  Scenario: Show edit link of the tag
    Given a card with title "Lo que sea"
    When I go to admin cards
    And I follow "Editar"
    Then I am on edit card of "Lo que sea"
