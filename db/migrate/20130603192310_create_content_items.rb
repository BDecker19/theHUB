class CreateContentItems < ActiveRecord::Migration
  def change
    create_table :content_items do |t|
      t.string :title
      t.integer :author_id
      t.string :type
      
      # Article columns
      t.text :body
      
      # Link columns
      t.text :intro
      t.string :url

      # Question columns
      t.text :description

      t.timestamps
    end
  end
end
