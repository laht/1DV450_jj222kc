node :self do 
	licenses_url
end

node :items do 
	partial 'licenses/instance', object: @licenses
end
