class WarehousesController < ApplicationController
    before_action :require_login
    before_action :find_warehouse, only:[:edit, :destroy, :show, :update]
    before_action :require_same_branch, only:[:edit, :destroy, :show, :update]

    def show
        @products = @warehouse.products
    end
    
    def edit
        #@warehouse.products.build
    end
    
    def new
        if last_warehouse = Warehouse.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_warehouse.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @warehouse = Warehouse.new
        #3.times { @warehouse.products.build }
        @warehouse.products.build
        @warehouse.code= "#{"WRH"}#{sprintf("%05d", new_code_number)}"
        @warehouse.branch = Branch.find(session[:branch_id])
    end
    
    def create
        if last_warehouse = Warehouse.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_warehouse.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @warehouse = Warehouse.new(warehouse_params)
        @warehouse.branch = Branch.find(session[:branch_id])
        @warehouse.code= "#{"SAL"}#{sprintf("%05d", new_code_number)}"
        
        if @warehouse.save
            flash[:success] = "Warehouse data created successfully!"
            redirect_to warehouses_path
        else
            render 'new'
        end
    end
    
    def destroy
        @warehouse.destroy
        flash[:warning] = "Warehouse data deleted successfully!"
        redirect_to warehouses_path
    end
    
    def update
    if @warehouse.update(warehouse_params)
        flash[:success] = "Warehouse data updated successfully!"
        redirect_to warehouses_path
    else
        render 'edit'
    end
    
    end
    
    def index
        @warehouses= Warehouse.where(branch_id: current_branch)
    end
    
    private
    
    def find_warehouse
        @warehouse = Warehouse.friendly.find(params[:id])
    end
    
    def warehouse_params
        params.require(:warehouse).permit(
            :code, :name, :description, :branch_id, :slug,
            products_attributes: Product.attribute_names.map(&:to_sym).push(:_destroy)
        )
    end
    
    def require_same_branch
        if current_user.branch_id != @warehouse.branch_id
            flash[:error]  = "You dont have permision for this action!"
            redirect_to accounts_path
        end
    end
    
end
    