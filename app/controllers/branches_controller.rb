class BranchesController < ApplicationController
    
    before_action :find_branch, only:[:edit, :destroy, :show, :update]
    
    def show
        @branch = Branch.find(params[:id])
    end
    
    def edit
        @branch = Branch.find(params[:id])
    end
    
    def new
        @branch = Branch.new
    end
    
    def create
      @branch = Branch.new(branch_params)
      if @branch.save
         flash[:notice] = "Branch created successfully!"
         redirect_to branches_path
      else
         render 'new'
      end
    end
    
    def destroy
        @branch = Branch.find(params[:id])
        @branch.destroy
        flash[:notice] = "Branch deleted successfully!"
        redirect_to branches_path
    end
    
    def update
      @branch = Branch.find(params[:id])
      if @branch.update(branch_params)
         flash[:notice] = "Branch updated successfully!"
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
