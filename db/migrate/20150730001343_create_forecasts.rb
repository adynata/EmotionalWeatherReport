class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.string :location, null: false
      t.date :date, null: false
      t.time :sunrise, null: false
      t.time :sunset, null: false
      t.string :conditions, null: false
      t.string :conditions_desc, null: false
      t.string :current_temp, null: false
      t.string :low_temp, null: false
      t.string :high_temp, null: false
      t.string :humidity, null: false
      t.timestamps null: false
    end
  end
end
