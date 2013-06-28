ThinkingSphinx::Index.define :user, :with => :active_record do
  
  # fields
  indexes email, :sortable => true
  # indexes content_items.title, :as => :post_titles, :sortable => true
  
    # working on this... may need to change STI structure?  should all 
    # content_item types simply override central content attribute?   
  # indexes articles.body, :as => :article_bodies
  # indexes author.name, :as => :author, :sortable => true

  # attributes
  # has created_at, updated_at
end