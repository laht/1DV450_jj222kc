class LicensesController < ReseponsController
	def index
		if params[:resource_id]
			@licenses = License.find_all_by_user_id(params[:resource_id])
		else	
			@licenses = License.all
		end
	end	

	def show
		@license = License.find(params[:id])
	rescue
		raise ActionController::RoutingError.new('Not Found')
	end

	def new
		@license = License.new
	end

	def destroy		
		l = License.find_by_id(params[:id])

		if l == nil
			self.notFound
		else
			l.destroy

			render :json => 
					{ :developer_message => 'The resource was successfully deleted.',
					  :user_message => 'The resource was not saved. Please try again.',
					},:status => :success
		end
		
	end

	def create
		l = License.new(licens_params)
		
		if l.save
			redirect_to license_url(l.id)
		else
			render :json => 
					{ :developer_message => 'Something went wrong while creating the resource.',
					  :user_message => 'The resource was not saved. Please try again.',
					  :api_startpage => resources_url
					},:status => :conflict
		end
	end

	def notFound
		render :template => 'application/NotFound', :status => :bad_request
	end

	private
	def licens_params
		params.permit(:license_type);
	end
end
