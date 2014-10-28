Feature: Display Statistics
  As a project maintainer
  In order to attract more users to AgileVentures
  I would like to present some attractive statistics to new visitors of WSO

  Background:
    Given the following articles exist:
      | Title     | Content |
      | Article 1 | -       |
      | Article 2 | -       |
      | Article 2 | -       |

    And the following projects exist:
      | title     | description | status   |
      | Project 1 | -           | active   |
      | Project 2 | -           | active   |
      | Project 3 | -           | active   |
      | Project 4 | -           | active   |
      | Project 5 | -           | inactive |
      | Project 6 | -           | inactive |

    And the following users exist
      | first_name | last_name | email                  |
      | Alice      | Jones     | alice@btinternet.co.uk |
      | Bob        | Butcher   | bobb112@hotmail.com    |

    And the following documents exist:
      | title      | project   |
      | Document 1 | Project 1 |
      | Document 2 | Project 2 |

    And following hangouts exist:
      | created_at | updated_at | title       | category        |
      | 8:15       | 8:30       | WebsiteOne  | Scrum           |
      | 10:15      | 11:45      | WebsiteOne  | Scrum           |
      | 11:15      | 11:45      | WebsiteOne  | Scrum           |
      | 9:10       | 9:40       | Autograders | PairProgramming |
      | 11:10      | 12:10      | Autograders | PairProgramming |
      | 12:00      | 12:30      | Autograders | PairProgramming |

    #2h 15min Scrums
    #2h PP


  Scenario: User visits the statistics page
    Given I am on the "home" page
    Then I should see link "Dashboard"
    When I click "Dashboard"
    Then I should be on the "Dashboard" page
    And I click the "Site statistics" link
    Then I should see "statistics" tab is active
    And I should see "Statistics"
    And I should see "3 Articles Published"
    And I should see "4 Active Projects"
    And I should see "3 AgileVentures Members"
    And I should see "2 Documents Created"


  Scenario: User signs up and then visits the statistics page
    Given I sign up with valid user data
    And I visit "/dashboard"
    Then I should see "4 AgileVentures Members"

# Comment from Brian: not sure how helpful having documents listed in the stats is, how about commit counts/story counts instead?

  @javascript
  Scenario: User visits the statistics page and clicks 'members'
    Given I visit "/dashboard"
    And I click the very stylish "members" button
    Then I should see a map

  Scenario: User creates a project and then visits the statistics page
    Given I am logged in
    And I create a project titled "Whatever project"
    And I visit "/dashboard"
    Then I should see "5 Active Projects"

  Scenario: User creates a document and then visits the statistics page
    Given I am logged in
    And I create a document titled "Plans for world domination"
    And I visit "/dashboard"
    Then I should see "3 Documents Created"

  Scenario: User creates an Article and then visits the statistics page
    Given I am logged in
    And I create an article titled "One weird tip for a flat belly"
    And I visit "/dashboard"
    Then I should see "4 Articles Published"

  Scenario: User host a scrum hangout and then visits the statistics page
    Given I am logged in
    And I host a scrum hangout for "30" minutes
    And I visit "/dashboard"
    Then I should see "165 Scrum Minutes"

  Scenario: User host a pair programming hangout and then visits the statistics page
    Given I am logged in
    And I host a pairprogramming hangout for "10" minutes
    And I visit "/dashboard"
    Then I should see "130 Pair Programming Minutes"

