class ContentItemQuestion < ContentItem
    attr_accessible :description

    def self.model_name
    	ContentItem.model_name
  	end

end