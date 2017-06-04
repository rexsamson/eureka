class BranchesController < ApplicationController
    before_action :require_login
    before_action :find_branch, only:[:edit, :destroy, :show, :update]
    
    def show
       
    end
    
    def edit
        
    end
    
    def new
        @branch = Branch.new
    end
    
    def create
        @branch = Branch.new(branch_params)
        if @branch.save
         flash[:success] = "Branch data created successfully!"
         redirect_to branches_path
        else
         render 'new'
        end
    end
    
    def destroy
        @branch.destroy
        flash[:warning] = "Branch data deleted successfully!"
        redirect_to branches_path
    end
    
    def update
      if @branch.update(branch_params)
         flash[:success] = "Branch data updated successfully!"
         redirect_to branches_path
      else
         render 'edit'
      end
    end
    
    def index
        @branches= Branch.all
    end
    
    private
    
    def find_branch
        @branch = Branch.find(params[:id])
    end
    
    def branch_params
      params.require(:branch).permit(:code, :name, :region, :city, :address, :telp, :cp, :description )
    end
   
end
