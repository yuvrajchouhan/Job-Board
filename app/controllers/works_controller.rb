class WorksController < ApplicationController
before_action :find_work, only: [:show, :edit, :update, :destroy]

def index
if params[:category].blank?
@works = Work.all.order("created_at DESC")
else	
	@category_id = Category.find_by(name: params[:category]).id
	@works = Work.where(category_id: @category_id).order("created_at DESC")
	end
end

def new
@work = Work.new
end

def show
end

	def create
		@work = Work.new(works_params)
		if @work.save
			redirect_to @work
		else
		render "New"	
	   end
	end

def edit
end

def update
	if @work.update(works_params)
		redirect_to @work
	else
		render "Edit"
	end
end

def destroy
	@work.destroy
	redirect_to root_path
end

private

def works_params
params.require(:work).permit(:title, :description, :company, :url, :category_id )	
end

def find_work
@work = Work.find(params[:id])
end

end
