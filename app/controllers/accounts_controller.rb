class AccountsController < ApplicationController

    def show
        @account = Account.find(params[:id])
    end
    
    def edit
        @account = Account.find(params[:id])
    end
    
    def new
        @account = Account.new
    end
    
    def create
      @account = Account.new(account_params)
      if @account.save
         flash[:notice] = "Account created successfully!"
         redirect_to accounts_path
      else
         render 'new'
      end
    end
    
    def destroy
        @account = Account.find(params[:id])
        @account.destroy
        flash[:notice] = "Account deleted successfully!"
        redirect_to accounts_path
    end
    
    def update
      @account = Account.find(params[:id])
      if @account.update(account_params)
         flash[:notice] = "Account updated successfully!"
         redirect_to accounts_path
      else
         render 'edit'
      end
    end
    
    def index
        @accounts= Account.all
    end
    
    def account_params
      params.require(:account).permit(:code, :label, :du, :dk, :header, :description, :id_branch )
    end
   
end