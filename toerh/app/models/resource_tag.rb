class ResourceTag < ActiveRecord::Base
	has_and_belongs_to_many :resources
	has_and_belongs_to_many :tags
end
