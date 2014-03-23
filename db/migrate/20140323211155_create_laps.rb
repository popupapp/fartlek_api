class CreateLaps < ActiveRecord::Migration
  def change
    create_table :laps do |t|
      t.float :lap_intensity
      t.integer :profile_id
      t.integer :lap_number
      t.string :lap_speech_string
      t.integer :lap_time

      t.timestamps
    end
  end
end
