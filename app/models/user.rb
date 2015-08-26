class User < ActiveRecord::Base
  has_secure_password
	def hello
    	self.name += ""
	end 
end
