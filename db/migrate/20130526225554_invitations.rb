class Invitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :invited_email
      t.integer :survey_id, :user_id
      t.timestamps
    end
  end
end
