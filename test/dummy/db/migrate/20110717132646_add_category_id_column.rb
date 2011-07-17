class AddCategoryIdColumn < ActiveRecord::Migration
  def up
		add_column :cms_pages, :category_id, :integer
  end

  def down
		remove_column :cms_pages, :category_id 
  end
end
