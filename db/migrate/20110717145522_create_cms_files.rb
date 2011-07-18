class CreateCmsFiles < ActiveRecord::Migration
  def change
    create_table :cms_files do |t|
      t.string :name
      t.string :file

      t.timestamps
    end
  end
end
