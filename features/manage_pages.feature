Feature: Manage Pages
	In order to control the content on my website
	As an administrator
	I want to create and manage pages

  Background:
		Given I have one main category titled "Main"
		And I have no pages

  Scenario: Pages List
		Given I have pages titled Portfolio, About
    When I go to the list of pages
    Then I should see "Portfolio"
    And I should see "About"

  Scenario: Create Valid Page
		When I go to the list of pages
    And I follow "New Page"
    And I fill in "Page title" with "Pickles"
		And I fill in "Link name" with "pickles"
    And I press "Create Page"
    Then I should see "Page was successfully created."
    And I should have 1 page

  Scenario: Create Invalid Page (without title and link)
		When I go to the list of pages
    And I follow "New Page"
    And I press "Create Page"
    Then I should see "Page title can't be blank"
		And I should see "Link name can't be blank"
    And I should have 0 pages

	Scenario: Create Duplicate Page
		Given I only have pages titled Portfolio, About
    When I go to the list of pages
    And I follow "New Page"
    And I fill in "Page title" with "About"
		And I fill in "Link name" with "about" 
    And I press "Create Page"
    Then I should see "Page title has already been taken"
		And I should see "Link name has already been taken"
		And I should have 2 pages

	Scenario: Move page down
		Given I only have pages titled Portfolio, About
    When I go to the list of pages
		And I follow "Move Down"
		Then I should see the page "About" before the page "Portfolio"

	Scenario: Move page up
		Given I only have pages titled Portfolio, About
    When I go to the list of pages
		And I follow "Move Up"
		Then I should see the page "About" before the page "Portfolio"
