class CreateDokuAdmins < ActiveRecord::Migration
  def change
    create_table :doku_admins do |t|

      t.timestamps
    end
  end
end
