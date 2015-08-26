class Comment < ActiveRecord::Base
	def hello
    	self.mapid += 1
	end
end
