Feature: Navigate Pages
	In order to navigate the pages the administrator creates
	As a visitor
	I want to follow the links to the created pages

	Background:
		Given I have no categories

	Scenario: Create a category and visit it
		When I go to the list of categories
    And I follow "New Category"
    And I fill in "Category title" with "Pickles"
		And I fill in "Link name" with "pickles"
		And I fill in "Body" with "My yar of pickles."
    And I press "Create Category"
		And I go to the pickles page
    Then I should see "My yar of pickles."

