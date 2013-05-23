class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
    t.integer :experience
    t.boolean :formal_education
    t.integer :user_id
    t.integer :skill_id

    t.timestamps
    end 
  end
end
