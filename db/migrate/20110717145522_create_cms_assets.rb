class CreateCmsAssets < ActiveRecord::Migration
  def change
    create_table :cms_assets do |t|
      t.string :name
      t.string :file

      t.timestamps
    end
  end
end
