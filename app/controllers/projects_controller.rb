class ProjectsController < ApplicationController
   
   before_action :find_projects, only: [:show, :update, :edit, :destroy]
   before_action :authenticate_user!, except: [:index, :show]

	def index
		@projects = Project.all.order("created_at desc")
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.create project_params

		if @project.save
			redirect_to projects_path, notice: "The project Successfully saved"
		else
			render 'new'
		end
	end

	def show
		@next_project = @project.next
		@prev_project = @project.prev
	end

	def edit
		
	end

	def update
		if @project.update project_params
			redirect_to project_path, notice: "the project have been successfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end

	private

	def project_params
		params.require(:project).permit(:title, :link ,:skills, :slug, :thumbnail, :description)
	end

	def find_projects
		@project = Project.friendly.find(params[:id])
	end
end
