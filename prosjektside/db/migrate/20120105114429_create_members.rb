class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.integer :age
      t.string :role
      t.string :pic

      t.timestamps
    end
  end
end
