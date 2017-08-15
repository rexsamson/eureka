class AreasController < ApplicationController
    before_action :require_login
    before_action :find_area, only:[:edit, :destroy, :show, :update]
    
    def show
       
    end
    
    def edit
       
    end
    
    def new
        @area = Area.new
    end
    
    def create
    @area = Area.new(area_params)
    @area.branch = Branch.find(session[:branch_id])
    
    if @area.save
        flash[:success] = "Area data created successfully!"
        redirect_to areas_path
    else
        render 'new'
    end
    end
    
    def destroy
        
        @area.destroy
        flash[:warning] = "Area data deleted successfully!"
        redirect_to areas_path
    end
    
    def update
     
      if @area.update(area_params)
         flash[:success] = "Area data updated successfully!"
         redirect_to areas_path
      else
         render 'edit'
      end
    end
    
    def index
        @areas= Area.all
    end
    
    private
    
    def find_area
        @area = Area.friendly.find(params[:id])
    end
    
    def area_params
      params.require(:area).permit(:code, :label, :du, :dk, :header, 
      :description, :branch_id, current_user.branch_id, :slug)
    end
end