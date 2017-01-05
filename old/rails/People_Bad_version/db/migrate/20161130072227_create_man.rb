class CreateMan < ActiveRecord::Migration
  def change
    create_table :men do |t|
      t.string :name, null: false
      t.integer :house_id, null: false
      t.timestamps
    end
  end
end
