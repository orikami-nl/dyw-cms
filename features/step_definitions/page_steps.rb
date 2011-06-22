Given /^I have no pages$/ do
  Cms::Page.delete_all
end

Given /^I (only )?have pages titled "?([^\"]*)"?$/ do |only, titles|
  Cms::Page.delete_all if only
	position = 1
  titles.split(', ').each do |title|
    @only_category.pages.create(:page_title => title, :link_name => title.downcase, :position => position)
		position = position + 1
  end
end

Given /^I (only )?have a page titled "?([^\"]*)"?$/ do |only, title|
  Cms::Page.delete_all if only
  @only_category.pages.create(:page_title => title, :link_name => title.downcase)
end

Then /^I should have ([0-9]+) pages?$/ do |count|
  @only_category.pages.count.should == count.to_i
end

Then /^I should see the page "([^"]*)" before the page "([^"]*)"$/ do |first, second|
  @only_category.pages.find_by_page_title(first).position.should == 1
  @only_category.pages.find_by_page_title(second).position.should == 2
end
