node :self do 
	tags_url
end

node :items do 
	partial 'tags/instance', object: @tags
end
