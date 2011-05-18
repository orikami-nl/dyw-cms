Given /^I have no pages$/ do
  Cms::Page.delete_all
end

Given /^I (only )?have pages titled "?([^\"]*)"?$/ do |only, titles|
  Cms::Page.delete_all if only
  titles.split(', ').each do |title|
    Cms::Page.create(:title => title, :link_url => "/" + title)
  end
end

Given /^I (only )?have a page titled "?([^\"]*)"?$/ do |only, title|
  Cms::Page.delete_all if only
  Cms::Page.create(:title => title, :link_url => "/" + title)
end

Then /^I should have ([0-9]+) pages?$/ do |count|
  Cms::Page.count.should == count.to_i
end
