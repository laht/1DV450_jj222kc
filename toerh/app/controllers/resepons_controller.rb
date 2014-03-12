class ReseponsController < ApplicationController
	before_action :default_format_json
	skip_before_filter :verify_authenticity_token
end
