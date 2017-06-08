class SuppliersController < ApplicationController
    before_action :require_login
    before_action :find_supplier, only:[:edit, :destroy, :show, :update]

    def show
        @addresses = @supplier.addresses
    end
    
    def edit
        #@supplier.addresses.build
    end
    
    def new
        if last_supplier = Supplier.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_supplier.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @supplier = Supplier.new
        #3.times { @supplier.addresses.build }
        @supplier.addresses.build
        @supplier.code= "#{"SUP"}#{sprintf("%05d", new_code_number)}"
        @supplier.branch = Branch.find(session[:branch_id])
    end
    
    def create
        if last_supplier = Supplier.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_supplier.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @supplier = Supplier.new(supplier_params)
        @supplier.branch = Branch.find(session[:branch_id])
        @supplier.code= "#{"SUP"}#{sprintf("%05d", new_code_number)}"
        
        if @supplier.save
            flash[:success] = "Supplier data created successfully!"
            redirect_to suppliers_path
        else
            render 'new'
        end
    end
    
    def destroy
        @supplier.destroy
        flash[:warning] = "Supplier data deleted successfully!"
        redirect_to suppliers_path
    end
    
    def update
    if @supplier.update(supplier_params)
        flash[:success] = "Supplier data updated successfully!"
        redirect_to suppliers_path
    else
        render 'edit'
    end
    
    end
    
    def index
        @suppliers= Supplier.paginate(page: params[:page], per_page: 20)
    end
    
    private
    
    def find_supplier
        @supplier = Supplier.find(params[:id])
    end
    
    def supplier_params
        params.require(:supplier).permit(
            :code, :name, :group, :cp, :status, :climit, :dlimit, :telp, :branch_id, 
            addresses_attributes: Address.attribute_names.map(&:to_sym).push(:_destroy)
        )
    end
end
    