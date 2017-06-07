class AccountsController < ApplicationController
    before_action :require_login
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
    @account.branch = Branch.find(session[:branch_id])
    
    if @account.save
        flash[:success] = "Account data created successfully!"
        redirect_to accounts_path
    else
        render 'new'
    end
    end
    
    def destroy
        
        @account.destroy
        flash[:warning] = "Account data deleted successfully!"
        redirect_to accounts_path
    end
    
    def update
     
      if @account.update(account_params)
         flash[:success] = "Account data updated successfully!"
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
      params.require(:account).permit(:code, :label, :du, :dk, :header, :description, :branch_id, current_user.branch_id)
    end
   
end