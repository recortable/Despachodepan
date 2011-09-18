Given /^a color with name "([^"]*)"$/ do |name|
  @color = Color.find_or_create_by_name name
end