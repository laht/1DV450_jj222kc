node :self do 
	users_url
end

node :items do 
	partial 'users/instance', object: @users
end
