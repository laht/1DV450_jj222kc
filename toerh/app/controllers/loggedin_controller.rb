class LoggedinController < ApplicationController

	before_action :require_login
	
	def show
		
	end

end
