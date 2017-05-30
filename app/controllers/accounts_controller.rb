class AccountsController < ApplicationController
    
    before_action :find_account, only:[:edit, :destroy, :show, :update]
    
    def show
       
    end
    
    def edit
       
    end
    
    def new
        @account = Account.new
    end
    
    def create
      @account = Account.new(account_params)
      @account.branch = Branch.first
      if @account.save
         flash[:notice] = "Account data created successfully!"
         redirect_to accounts_path
      else
         render 'new'
      end
    end
    
    def destroy
        
        @account.destroy
        flash[:notice] = "Account data deleted successfully!"
        redirect_to accounts_path
    end
    
    def update
     
      if @account.update(account_params)
         flash[:notice] = "Account data updated successfully!"
         redirect_to accounts_path
      else
         render 'edit'
      end
    end
    
    def index
        @accounts= Account.all
    end
    
    private
    
    def find_account
        @account = Account.find(params[:id])
    end
    
    def account_params
      params.require(:account).permit(:code, :label, :du, :dk, :header, :description, :branch_id )
    end
   
end