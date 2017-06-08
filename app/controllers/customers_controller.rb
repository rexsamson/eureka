class CustomersController < ApplicationController
    before_action :require_login
    before_action :find_customer, only:[:edit, :destroy, :show, :update]

    def show
        @addresses = @customer.addresses
    end
    
    def edit
        #@customer.addresses.build
    end
    
    def new
        if last_customer = Customer.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_customer.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @customer = Customer.new
        #3.times { @customer.addresses.build }
        @customer.addresses.build
        @customer.code= "#{"CST"}#{sprintf("%05d", new_code_number)}"
        @customer.branch = Branch.find(session[:branch_id])
    end
    
    def create
        if last_customer = Customer.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_customer.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @customer = Customer.new(customer_params)
        @customer.branch = Branch.find(session[:branch_id])
        @customer.code= "#{"CST"}#{sprintf("%05d", new_code_number)}"
        
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
        @customers= Customer.paginate(page: params[:page], per_page: 20)
    end
    
    private
    
    def find_customer
        @customer = Customer.find(params[:id])
    end
    
    def customer_params
        params.require(:customer).permit(
            :code, :name, :group, :cp, :status, :climit, :dlimit, :tclimit, :tdlimit, :telp, :branch_id, 
            addresses_attributes: Address.attribute_names.map(&:to_sym).push(:_destroy)
        )
        #params.require(:todo_list).permit(:name, tasks_attributes: Task.attribute_names.map(&:to_sym).push(:_destroy))
    end
   
end
    