class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|
      t.string :name
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
