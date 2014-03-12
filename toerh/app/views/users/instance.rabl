collection @tags

 node do |e|
 	{
 		:href => tag_url(e.id)
 	}
 end

 node :data do |e|
 	{
  		:firstname => e.firstname,
  		:surname => e.lastname,
  		:email => e.email,
  		:number_of_posts => e.numberOfPosts,
  		:created_at => e.created_at
 	}
 end

 node :links do |e|
 	{
 		:resources => user_resources_url(e.id)
 	}
 end