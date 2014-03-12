class ResourcesController < ReseponsController
	respond_to :json, :xml	

	def index
		if params[:user_id]
			@resources = Resource.find_all_by_user_id(params[:user_id])
		else	
			@resources = Resource.all
		end		
	end	

	def show
		@resource = Resource.find_by_id(params[:id]);
	end

	def new
		@resource = Resource.new
	end

	def create
		r = Resource.new(resource_params)
		
		if r.save
			redirect_to resource_url(r.id)
		else
			render :json => { :developer_message => 'Something went wrong while creating the resource.',
							  :user_message => 'The resource was not saved. Please try again.',
							  :api_startpage => resources_url
							},:status => :conflict
		end
	end

	private
	def resource_params
		params.permit(:resource, :user_id, :license_id, :resource_type_id);
	end	
end
