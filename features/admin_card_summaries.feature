Feature: Admin card summaries
  So that I can edit cards
  As an authenticated user
  I want to see card summaries

  Scenario: Show the summaries of the cards
    Given a card with title "Cualquiera"
    When I go to admin cards
    Then I should see "Cualquiera"

