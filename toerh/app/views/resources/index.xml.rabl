node :self do 
	resources_url
end

node :items do 
	partial 'resources/instance', object: @resources
end
