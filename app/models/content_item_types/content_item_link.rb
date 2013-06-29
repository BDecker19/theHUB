class ContentItemLink < ContentItem
    attr_accessible :intro, :url

	def self.model_name
    	ContentItem.model_name
  	end

end