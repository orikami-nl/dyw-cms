class RenameUrlColumn < ActiveRecord::Migration
  def up
		rename_column :cms_pages, :link_url, :link
  end

  def down
		rename_column :cms_pages, :link, :link_url
  end
end
