Feature: Navigate Pages
	In order to navigate the pages I create
	As an administrator
	I want to visit my created pages

	Background:
		Given I have no pages

	Scenario: Create Page and visit it
		When I go to the list of pages
    And I follow "New Page"
    And I fill in "Title" with "Pickles"
		And I fill in "Link url" with "/pickles"
		And I fill in "Body" with "My yar of pickles."
    And I press "Create Page"
		And I go to the pickles page
    Then I should see "My yar of pickles."

