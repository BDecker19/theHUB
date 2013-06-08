class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :liker_id
      t.integer :liked_id
      t.string :liked_type

      t.timestamps
    end
  end
end
