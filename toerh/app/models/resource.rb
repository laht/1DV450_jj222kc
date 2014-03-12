class Resource < ActiveRecord::Base
	belongs_to :resource_type
	belongs_to :user
	belongs_to :license
	has_and_belongs_to_many :tags

	def getAuthor
		u = User.find_by_id(self.user_id)
		return "#{u.firstname} #{u.lastname}"
	end

	def getResource
		Resource.find_by_id(self.id).resource
	end

	def getLicense
		License.find_by_id(self.license_id)		
	end

	def getResourceType
		ResourceType.find_by_id(self.resource_type_id)
	end 

	def getUser
		User.find_by_id(self.user_id)
	end

	def getTags
		Resource.find_by_id(self.id).tags.first
	end	

end
