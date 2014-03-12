class UsersController < ReseponsController
	
	def index		
		if params[:resource_id]
			@users = User.find_all_by_id(params[:resource_id])
		else	
			@users = User.all
		end	
	end

	def create
		u = User.new(user_params)
		
		if u.save
			redirect_to user_url(u.id)
		else
			render :json => 
					{ :developer_message => 'Something went wrong while creating the resource.',
					  :user_message => 'The resource was not saved. Please try again.',
					  :api_startpage => resources_url
					},:status => :conflict
		end
	end

## login and logout
	def login 
		u = User.find_by_email(params[:email])
		if u && u.authenticate(params[:password])
			session[:userid] = u.id
			redirect_to loggedin_path
		else
			flash[:notice] = "Fel inloggningsupptifter!"
			redirect_to root_path
		end
	end

	def logout
		session[:userid] = nil
		redirect_to root_path, :notice => "Du har loggat ut!"
	end

##private methods
	private
	def user_params
		params.permit(:email, :firstname, :lastname);
	end

end
