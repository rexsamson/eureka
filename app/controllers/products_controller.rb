class ProductsController < ApplicationController
    before_action :require_login
    before_action :find_product, only:[:edit, :destroy, :update]
    before_action :require_same_branch, only:[:edit, :destroy, :show, :update]
    
    def edit
        @product_setting_quality = ProductSetting.where(product_type: "Quality")
        @product_setting_size = ProductSetting.where(product_type: "Size")
        @product_setting_type = ProductSetting.where(product_type: "Type")
        @product_setting_color = ProductSetting.where(product_type: "Color")
        @product_setting_density = ProductSetting.where(product_type: "Density")
        @product_setting_motif = ProductSetting.where(product_type: "Motif")
        @product_setting_brand = ProductSetting.where(product_type: "Brand")
    end
    
    def new
        @product = Product.new
        @product_setting_quality = ProductSetting.where(product_type: "Quality")
        @product_setting_size = ProductSetting.where(product_type: "Size")
        @product_setting_type = ProductSetting.where(product_type: "Type")
        @product_setting_color = ProductSetting.where(product_type: "Color")
        @product_setting_density = ProductSetting.where(product_type: "Density")
        @product_setting_motif = ProductSetting.where(product_type: "Motif")
        @product_setting_brand = ProductSetting.where(product_type: "Brand")
    end
    
    def create
        @product = Product.new(product_params)
        @product.branch = current_branch
        @product.name = 
            @product.products_brand + ' ' +
            @product.products_size +  ' ' +
            @product.products_motif + ' ' +
            @product.products_type + ' ' +
            @product.products_density + ' ' +
            @product.products_color + ' ' +
            @product.products_quality
        
        if @product.save
            flash[:success] = "Product data created successfully!"
            redirect_to products_path
        else
            render 'new'
        end
    end
    
    def destroy
        @product.destroy
        flash[:warning] = "Product data deleted successfully!"
        redirect_to products_path
    end
    
    def update
        if @product.update(product_params)
            flash[:success] = "Product data updated successfully!"
            redirect_to products_path
        else
            render 'edit'
        end
    end
    
    def index
        @products= Product.where(branch_id: current_branch).paginate(page: params[:page], per_page: 30)
    end
    
    private
    
    def find_product
        @product = Product.friendly.find(params[:id])
    end
    
    def product_params
        params.require(:product).permit(
            :code, 
            :name, 
            :kw, 
            :products_brand, 
            :products_size, 
            :products_motif, 
            :products_type, 
            :products_density, 
            :products_color, 
            :products_quality, 
            :branch_id, 
            current_user.branch_id, 
            :slug
        )
    end
    
    def require_same_branch
        if current_user.branch_id != @product.branch_id
            flash[:error]  = "You dont have permision for this action!"
            redirect_to products_path
        end
    end
   

end