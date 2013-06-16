class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.text :text

      t.timestamps
    end
  end
end
