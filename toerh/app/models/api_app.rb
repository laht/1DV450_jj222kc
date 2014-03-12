# encoding: utf-8
class ApiApp < ActiveRecord::Base
	has_one :apikey	
	
	validates :contact_mail, :presence => {:message => "Du måste ange en epost"},
	:uniqueness => true
	validates_format_of :contact_mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "Ange en korrekt epost"
end
