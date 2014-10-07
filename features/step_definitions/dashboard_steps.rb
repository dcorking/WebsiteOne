And(/^I create a project titled "([^"]*)"$/) do |title|
  steps %Q{
    Given I am on the "projects" page
    And I click the very stylish "New Project" button
    When I fill in "Title" with "#{title}"
    And I click the "Submit" button
  }
end