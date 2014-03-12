collection @tags

 node do |e|
 	{
 		:href => tag_url(e.id)
 	}
 end

 node :data do |e|
 	{
  		:licence => e.tag,
  		:created_at => e.created_at
 	}
 end

 node :links do |e|
 	{
 		:resources => tag_resources_url(e.id)
 	}
 end