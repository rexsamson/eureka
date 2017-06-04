class CustomersController < ApplicationController
    before_action :require_login
    before_action :find_customer, only:[:edit, :destroy, :show, :update]
    
    def show
        @addresses = @customer.addresses
    end
    
    def edit
        @customer.addresses.build
    end
    
    def new
        @customer = Customer.new
        3.times { @customer.addresses.build }
    end
    
    def create
      @customer = Customer.new(customer_params)
      @customer.branch = Branch.first
      if @customer.save
         flash[:success] = "Customer data created successfully!"
         redirect_to customers_path
      else
         render 'new'
      end
    end
    
    def destroy
        
        @customer.destroy
        flash[:warning] = "Customer data deleted successfully!"
        redirect_to customers_path
    end
    
    def update
     
      if @customer.update(customer_params)
         flash[:success] = "Customer data updated successfully!"
         redirect_to customers_path
      else
         render 'edit'
      end
    end
    
    def index
        @customers= Customer.all

    end
    
    private
    
    def find_customer
        @customer = Customer.find(params[:id])
    end
    
    def customer_params
        params.require(:customer).permit(
            :code, :name, :group, :cp, :status, :climit, :dlimit, :tclimit, :tdlimit, :branch_id,
            addresses_attributes: [:id, :name, :address, :region, :city, :_destroy]
        )
    end
   
end
    