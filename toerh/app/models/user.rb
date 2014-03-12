# encoding: utf-8
class User < ActiveRecord::Base
	has_many :resources
	validates :firstname, :presence => {:message => "Du måste ange ett förnamn"}
	validates :lastname, :presence => {:message => "Du måste ange ett efternamn"}
	validates :email, :presence => {:message => "Du måste ange en epost"},
	:uniqueness => true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "Ange en korrekt epost"


	def getFullName
		u = User.find_by_id(self.id)
		return "#{u.firstname} #{u.lastname}"
	end

	def numberOfPosts
		self.resources.size
	end

end
