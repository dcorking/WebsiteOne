And(/^I create a project titled "([^"]*)"$/) do |title|
  steps %Q{
    Given I am on the "projects" page
    And I click the very stylish "New Project" button
    When I fill in "Title" with "#{title}"
    And I fill in "Description" with "Whatever description"
    And I click the "Submit" button
  }
end

And(/^I create a document titled "([^"]*)"$/) do |title|
  steps %Q{
    Given I am on the "Show" page for project "Project 1"
    When I click the "Join Project" button
    And I click the "Create new document" button
    And I fill in "Title" with "#{title}"
    And I click "Submit"
  }
end

And(/^I create an article titled "([^"]*)"$/) do |title|
  steps %Q{
    Given I am on the "Articles" page
    And I click the very stylish "New Article" button
    Then I should see "Create a New Article"
    When I fill in "Title" with "#{title}"
    And I fill in "Content" with "**An example of** ``Markdown``"
    And I click the "Create" button
  }
end