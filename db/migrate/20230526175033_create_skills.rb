class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.integer :user_id
      t.string :skill_name
      t.string :skill_description
      t.integer :privacy

      t.timestamps
    end
  end
end
