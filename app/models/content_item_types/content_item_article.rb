class ContentItemArticle < ContentItem
    attr_accessible :body

    def self.model_name
    	ContentItem.model_name
  	end


end