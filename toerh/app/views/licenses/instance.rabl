collection @licenses

 node do |e|
 	{
 		:href => license_url(e.id)
 	}
 end

 node :data do |e|
 	{
  		:licence => e.license_type,
  		:created_at => e.created_at
 	}
 end

 node :links do |e|
 	{
 		:resources => license_resources_url(e.id)
 	}
 end