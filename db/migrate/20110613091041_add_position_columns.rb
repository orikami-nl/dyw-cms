class AddPositionColumns < ActiveRecord::Migration
  def up
		add_column :cms_pages, :position, :integer
		add_column :cms_categories, :position, :integer
  end

  def down
		remove_column :cms_pages, :position
		remove_column :cms_categories, :position
  end
end
