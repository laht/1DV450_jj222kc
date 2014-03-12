class ResourceTypesController < ReseponsController
	def index
		if params[:resource_id]
			@resources = ResourceType.find_all_by_id(params[:resource_id])
		else	
			@resources = ResourceType.all
		end	
	end

	def show
		@resource = ResourceType.find(params[:id])
	rescue
		raise ActionController::RoutingError.new('Not Found')
	end

	def new
		@resource = ResourceType.new
	end

	def create
		@resource = ResourceType.new(resource_params)

		if ResourceType.find_by_resource_type(@resource.resource_type)
			flash[:notice] = "Resursen finns redan"
			render :action => "new"
			return
		end

		if @resource.save
			redirect_to resource_types_path, :notice => "Ny resurs har lagts till"
		else
			render :action => "new"
		end
	end

	private
	def resource_params
		params.fetch(:resource_type, {}).permit(:resource_type)
	end
end
