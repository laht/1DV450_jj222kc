class ApiAppsController < ApplicationController
	def new
		@app = ApiApp.new
	end

	def create
		@app = ApiApp.new(app_params)
		if @app.save

			appkey = Apikeys.new
			appkey.application_id = @app.id
			appkey.auth_token = assign_token
			appkey.save
			flash[:key] = appkey.auth_token
			redirect_to root_path 
		else	
			render :action => 'new'
		end
	end

##private methods
	private 
	def app_params
		params.fetch(:api_app, {}).permit(:contact_mail)
	end

	def assign_token
		token = Random.new_seed

		while validateToken(token) == true
			token = getTokenValue
		end

		return token
	end

	def validateToken(token)
		tokens = Apikeys.pluck :auth_token 
		return tokens.include? (token)
	end

	def getTokenValue
		Random.new_seed
	end

	def apikey
		params.fetch(:api_user, {}).permit(:contact_mail, :first_name, :last_name, :password)
	end

end
