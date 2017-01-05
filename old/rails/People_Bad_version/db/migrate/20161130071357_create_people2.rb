class CreatePeople2 < ActiveRecord::Migration
  def change
    create_table :people2 do |t|
      t.string :name, null: false
      t.integer :house_id, null: false
      t.timestamps
    end
  end
end
