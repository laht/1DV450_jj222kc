class TagsController < ReseponsController
	
	def index
		if params[:resource_id]
			@tags = Tag.find_all_by_id(params[:resource_id])
		else	
			@tags = Tag.all
		end	
	end
	def show
		@tags = Tag.find(params[:id])
	rescue
		raise ActionController::RoutingError.new('Not Found')
	end

	def new
		@tag = Tag.new
	end

	def destroy
		l = Tag.find_by_id(params[:id])

		if l.destroy
			render 
		else
			self.notFound
		end
	end

	def create
		t = Tag.new(tag_params)
		
		if t.save
			redirect_to tag_url(t.id)
		else
			render :json => 
					{ :developer_message => 'Something went wrong while creating the resource.',
					  :user_message => 'The resource was not saved. Please try again.',
					  :api_startpage => resources_url
					},:status => :conflict
		end
	end

	

	private
	def tag_params
		params.permit(:tag);
	end
end
