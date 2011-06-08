class Titles < ActiveRecord::Migration
  def up
		rename_column :cms_pages, :title, :page_title
		rename_column :cms_categories, :title, :category_title
  end

  def down
		rename_column :cms_pages, :page_title, :title
		rename_column :cms_categories, :category_title, :title
  end
end
