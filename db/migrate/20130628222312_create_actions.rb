class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :actor_id
      t.integer :action_product_id
      t.string :action_product_type
      t.integer :acted_on_id
      t.string :acted_on_type
      t.integer :relevancy_id
      t.integer :relevancy_value

      t.timestamps
    end
  end
end
