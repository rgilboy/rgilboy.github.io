class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :fan
      t.integer :skill

      t.timestamps
    end
  end
end
