class RenameUrlColumnAgain < ActiveRecord::Migration
  def up
		rename_column :cms_pages, :link, :link_name
  end

  def down
		rename_column :cms_pages, :link_name, :link
  end
end
