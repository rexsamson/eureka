class AccountsController < ApplicationController
    before_action :require_login
    before_action :find_account, only:[:edit, :destroy, :show, :update]
    before_action :require_same_branch, only:[:edit, :destroy, :show, :update]
    
    def edit
    
    end
    
    def new
        @account = Account.new
    end
    
    def create
        @account = Account.new(account_params)
        @account.branch = current_branch
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
        @accounts= Account.where(branch_id: current_branch)
    end
    
    private
    
    def find_account
        @account = Account.friendly.find(params[:id])
    end
    
    def account_params
        params.require(:account).permit(:code, :label, :du, :dk, :header, :description, :branch_id, current_user.branch_id, :slug)
    end
    
    def require_same_branch
        if current_user.branch_id != @account.branch_id
            flash[:error]  = "You dont have permision for this action!"
            redirect_to accounts_path
        end
    end

end