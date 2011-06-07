class CreateCmsCategories < ActiveRecord::Migration
  def change
    create_table :cms_categories do |t|
      t.string :title
      t.string :link_name
      t.text :body

      t.timestamps
    end
  end
end
