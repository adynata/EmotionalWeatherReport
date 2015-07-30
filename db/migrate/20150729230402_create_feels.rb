class CreateFeels < ActiveRecord::Migration
  def change
    create_table :feels do |t|
      t.string :feel, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
    add_index :feels, :user_id
  end
end
