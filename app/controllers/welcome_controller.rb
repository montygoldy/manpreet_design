class WelcomeController < ApplicationController
	def index
		@projects = Project.all.limit(3).order("created_at desc") 
	end
end
