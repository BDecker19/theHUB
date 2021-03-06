class CreateContentItems < ActiveRecord::Migration
  def change
    create_table :content_items do |t|
      
      # Universal columns
      t.string :title
      t.integer :author_id
      t.integer :category_id
            
      # Article columns
      t.text :body
      
      # Link columns
      t.text :intro
      t.string :url

      # Question columns
      t.text :description

      t.timestamps

      ## Custom
      t.string :type

    end
  end
end
