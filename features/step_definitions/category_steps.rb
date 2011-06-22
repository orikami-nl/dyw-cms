Given /^I have no categories$/ do
  Cms::Category.delete_all
end

Given /^I (only )?have categories titled "?([^\"]*)"?$/ do |only, titles|
  Cms::Category.delete_all if only
	position = 1
  titles.split(', ').each do |title|
    Cms::Category.create(:category_title => title, :link_name => title.downcase, :position => position)
		position = position + 1
  end
end

Given /^I (only )?have a category titled "?([^\"]*)"?$/ do |only, title|
  Cms::Category.delete_all if only
  Cms::Category.create(:category_title => title, :link_name => title.downcase, :position => 1)
end

Given /^I have one main category titled "?([^\"]*)"?$/ do |title|
	Cms::Category.delete_all
	@only_category = Cms::Category.create!(:category_title => title, :link_name => title.downcase, :position => 1)
end

Then /^I should have ([0-9]+) categories?$/ do |count|
  Cms::Category.count.should == count.to_i
end

Then /^I should have 1 category$/ do
  Cms::Category.count.should == 1
end

Then /^I should see "([^"]*)" before "([^"]*)"$/ do |first, second|
  Cms::Category.find_by_category_title(first).position.should == 1
  Cms::Category.find_by_category_title(second).position.should == 2
end
