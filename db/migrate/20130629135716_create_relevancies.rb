class CreateRelevancies < ActiveRecord::Migration
  def change
    create_table :relevancies do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :score

      t.timestamps
    end
  end
end
