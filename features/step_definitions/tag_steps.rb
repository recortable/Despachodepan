Given /^a tag with name "([^"]*)" and color "([^"]*)"$/ do |name, color|
  @color = Color.find_or_create_by_name color
  @tag = Tag.create name: name, color: @color
end

When /^I add the tag "([^"]*)" to the card "([^"]*)"$/ do |tag_name, card_title|
  tag = Tag.find_by_name tag_name
  card = Card.find_by_title card_title
  card.tags << tag
  card.save
end