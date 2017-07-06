class AssetmsController < ApplicationController
    before_action :require_login
    before_action :find_assetm, only:[:edit, :destroy, :show, :update]
    before_action :require_same_branch, only:[:edit, :destroy, :show, :update]

    def show
        @asset_details = @assetm.asset_details
    end
    
    def edit
        #@assetm.asset_details.build
    end
    
    def new
        if last_assetm = Assetm.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_assetm.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @assetm = Assetm.new
        #3.times { @assetm.asset_details.build }
        @assetm.asset_details.build
        @assetm.code= "#{"AST"}#{sprintf("%05d", new_code_number)}"
        @assetm.branch = Branch.find(session[:branch_id])
    end
    
    def create
        if last_assetm = Assetm.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_assetm.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @assetm = Assetm.new(assetm_params)
        @assetm.branch = Branch.find(session[:branch_id])
        @assetm.code= "#{"AST"}#{sprintf("%05d", new_code_number)}"
        
        if @assetm.save
            flash[:success] = "Asset data created successfully!"
            redirect_to assetms_path
        else
            render 'new'
        end
    end
    
    def destroy
        @assetm.destroy
        flash[:warning] = "Asset data deleted successfully!"
        redirect_to assetms_path
    end
    
    def update
    if @assetm.update(assetm_params)
        flash[:success] = "Asset data updated successfully!"
        redirect_to assetms_path
    else
        render 'edit'
    end
    
    end
    
    def index
        @assetms= Assetm.where(branch_id: current_branch)
    end
    
    private
    
    def find_assetm
        @assetm = Assetm.friendly.find(params[:id])
    end
    
    def assetm_params
        params.require(:assetm).permit(
            :code,
            :name, 
            :category, 
            :location, 
            :unit, 
            :value, 
            :date, 
            :warranty,
            :status, 
            :serial, 
            :description, 
            :slug,
            :branch_id,
            asset_details_attributes: AssetDetail.attribute_names.map(&:to_sym).push(:_destroy)
        )
    end
    
    def require_same_branch
        if current_user.branch_id != @assetm.branch_id
            flash[:error]  = "You dont have permision for this action!"
            redirect_to assetms_path
        end
    end
    
end
    