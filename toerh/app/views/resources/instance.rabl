collection @resources

node do |e|
	{
		:href => resource_url(e.id)
	}
end

node :data do |e|
	{
		:author => e.getUser.getFullName,
		:user => e.getUser.email,
 		:url => e.getResource,
 		:resource_type => e.getResourceType.resource_type,
 		:licence => e.getLicense.license_type
	}
end

node :links do |e|
	{
		:user => user_url(e.getUser.id),
		:tags => resource_tags_url(e.id),
		:resource_type => resource_type_url(e.getResourceType.id),
		:licence => license_url(e.getLicense)
	}
end