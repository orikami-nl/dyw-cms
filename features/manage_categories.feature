Feature: Manage Categories
	In order to control the content on my website
	As an administrator
	I want to create and manage categories of pages

  Background:
		Given I have no categories

  Scenario: Categories List
		Given I have categories titled Portfolio, About
    When I go to the list of categories
    Then I should see "Portfolio"
    And I should see "About"

  Scenario: Create Valid Category
		When I go to the list of categories
    And I follow "New Category"
    And I fill in "Category title" with "Pickles"
		And I fill in "Link name" with "pickles"
    And I press "Create Category"
    Then I should see "Category was successfully created."
    And I should have 1 category

  Scenario: Create Invalid Category (without title and link name)
		When I go to the list of categories
    And I follow "New Category"
    And I press "Create Category"
    Then I should see "Category title can't be blank"
		And I should see "Link name can't be blank"
    And I should have 0 categories

	Scenario: Create Duplicate Category
		Given I only have categories titled Portfolio, About
    When I go to the list of categories
    And I follow "New Category"
    And I fill in "Category title" with "About"
		And I fill in "Link name" with "about" 
    And I press "Create Category"
    Then I should see "Category title has already been taken"
		And I should see "Link name has already been taken"
		And I should have 2 categories
  
	Scenario: Move category down
		Given I only have categories titled Portfolio, About
    When I go to the list of categories
		And I follow "Move Down"
		Then I should see "About" before "Portfolio"
		
	Scenario: Move category up
		Given I only have categories titled Portfolio, About
    When I go to the list of categories
		And I follow "Move Up"
		Then I should see "About" before "Portfolio"
		
