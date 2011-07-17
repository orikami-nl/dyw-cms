class CreateCmsPages < ActiveRecord::Migration
  def change
    create_table :cms_pages do |t|
      t.string :title
      t.string :link_url
      t.text :body

      t.timestamps
    end
  end
end
