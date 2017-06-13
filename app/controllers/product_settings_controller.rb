class ProductSettingsController < ApplicationController
    before_action :require_login
    before_action :find_product_setting, only:[:edit, :destroy, :show, :update]
    before_action :require_same_branch, only:[:edit, :destroy, :show, :update]
    
    def edit
       
    end
    
    def new
        @product_setting = ProductSetting.new
    end
    
    def create
    @product_setting = ProductSetting.new(product_setting_params)
    @product_setting.branch = current_branch
    
    if @product_setting.save
        flash[:success] = "Product Setting data created successfully!"
        redirect_to product_settings_path
    else
        render 'new'
    end
    end
    
    def destroy
        
        @product_setting.destroy
        flash[:warning] = "Product Setting data deleted successfully!"
        redirect_to product_settings_path
    end
    
    def update
     
      if @product_setting.update(product_setting_params)
         flash[:success] = "Product Setting data updated successfully!"
         redirect_to product_settings_path
      else
         render 'edit'
      end
    end
    
    def index
        @product_settings= ProductSetting.where(branch_id: current_branch)
    end
    
    private
    
    def find_product_setting
        @product_setting = ProductSetting.friendly.find(params[:id])
    end
    
    def product_setting_params
      params.require(:product_setting).permit(:code, :name, :product_type, :branch_id, current_user.branch_id, :slug)
    end
    
    def require_same_branch
        if current_user.branch_id != @product_setting.branch_id
            flash[:error]  = "You dont have permision for this action!"
            redirect_to product_settings_path
        end
    end
   
end