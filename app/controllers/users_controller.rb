class UsersController < ApplicationController
    before_action :find_user, only:[:edit, :destroy, :update]
    before_action :require_login, except:[:new, :create]
    before_action :require_same_user, only:[:show, :edit, :destroy, :update]
    
    def show 
        @user = User.find(params[:id])
    end
    
    def edit
    end
    
    def update
        if @user.update(user_params)
        flash[:success] = "User profile updated successfully"
        redirect_to pages_path
        
        else
         render 'edit'
        end
    end
    
    def new
        @user = User.new
        render :layout => false
    end
    
    def create
        @user = User.new(user_params)
        @user.branch = Branch.first
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "User created successfully"
        redirect_to pages_path, :layout => false
        else
            render 'new', :layout => false
            
        end
        
    end
    
    def destroy
        @user.destroy
        flash[:warning] = "User data deleted successfully"
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
    
    def require_same_user
        if current_user != User.find(params[:id])
            flash[:error]  = "You dont have permision for this action!"
            redirect_to pages_path
        end
        
    end
end
