Feature: Manage Pages
	In order to control the content on my website
	As an administrator
	I want to create and manage pages

  Background:
		Given I have no pages

  Scenario: Pages List
		Given I have pages titled Home, About
    When I go to the list of pages
    Then I should see "Home"
    And I should see "About"

  Scenario: Create Valid Page
		When I go to the list of pages
    And I follow "New Page"
    And I fill in "Title" with "Pickles are Cucumbers Soaked in Evil"
		And I fill in "Link url" with "/pickles"
    And I press "Create Page"
    Then I should see "Page was successfully created."
    And I should have 1 page

  Scenario: Create Invalid Page (without title and link url)
		When I go to the list of pages
    And I follow "New Page"
    And I press "Create Page"
    Then I should see "Title can't be blank"
		And I should see "Link url can't be blank"
    And I should have 0 pages

	Scenario: Create Duplicate Page
		Given I only have pages titled Home, About
    When I go to the list of pages
    And I follow "New Page"
    And I fill in "Title" with "About"
		And I fill in "Link url" with "/About" 
    And I press "Create Page"
    Then I should see "Title has already been taken"
		And I should see "Link url has already been taken"
		And I should have 2 pages
