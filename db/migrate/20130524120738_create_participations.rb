class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.string :invited
      t.integer :survey_id, :user_id
      t.timestamps
    end
  end
end
