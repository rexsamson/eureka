class UsersController < ApplicationController

    before_action :find_user, only:[:edit, :destroy, :update]
    
    def show 
        @user = User.find(params[:id])
    end
    
    def edit
    end
    
    def update
        @user.update(user_params)
        flash[:notice] = "User data updated successfully"
        redirect_to users_path
    end
    
    def new
        @user = User.new
        render :layout => false
    end
    
    def create
        @user = User.new(user_params)
        @user.branch = Branch.first
        if @user.save
            flash[:notice] = "User created successfully, please login!"
        redirect_to login_path, :layout => false
        else
            render 'new', :layout => false
            
        end
        
    end
    
    def destroy
        @user.destroy
        flash[:notice] = "User data deleted successfully"
        redirect_to users_path
    end
    
    def index
        @users = User.all
    end
    
    private
    
    def find_user
        @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :fullname, :email, :password, :password_digest, :branch_id )
     
    end
end