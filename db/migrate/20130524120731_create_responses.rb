class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id, :choice_id, :question_id
    end
  end
end
