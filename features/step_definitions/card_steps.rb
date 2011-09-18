Given /^a card with title "([^"]*)"$/ do |title|
  @card = Card.create title: title
end