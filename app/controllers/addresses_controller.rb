class AddressesController < ApplicationController
    before_action :require_login
    before_action :find_address, only:[:edit, :destroy, :show, :update]
    
    def show
       
    end
    
    def edit
       
    end
    
    def new
        @address = Address.new
    end
    
    def create
      @address = Address.new(address_params)
      @address.branch = Branch.find(session[:branch_id])
      if @address.save
         flash[:success] = "Address data created successfully!"
         redirect_to addresses_path
      else
         render 'new'
      end
    end
    
    def destroy
        
        @address.destroy
        flash[:warning] = "Address data deleted successfully!"
        redirect_to addresses_path
    end
    
    def update
     
      if @address.update(address_params)
         flash[:success] = "Address data updated successfully!"
         redirect_to addresses_path
      else
         render 'edit'
      end
    end
    
    def index
        @addresses= Address.all
    end
    
    private
    
    def find_address
        @address = Address.find(params[:id])
    end
    
    def address_params
      params.require(:address).permit(:name, :address, :region, :city, :status, :description, :branch_id )
    end
  
end
