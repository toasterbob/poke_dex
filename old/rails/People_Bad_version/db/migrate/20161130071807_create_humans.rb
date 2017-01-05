class CreateHumans < ActiveRecord::Migration
  def change
    create_table :humans do |t|
      t.string :name, null: false
      t.integer :house_id, null: false
      t.timestamps
    end
  end
end
