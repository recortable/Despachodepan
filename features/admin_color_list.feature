Feature: Admin color list
  So that I can edit colors
  As an authenticated user
  I want to see a color list

  Scenario: Show the name of the color
    Given a color with name "Rojo"
    When I go to admin colors
    Then I should see "Rojo"