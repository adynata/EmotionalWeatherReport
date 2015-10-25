class AddColorsToFeelsTable < ActiveRecord::Migration
  def change
    add_column :feels, :color, :string

  end
end
