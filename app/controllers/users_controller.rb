class UsersController < ApplicationController
    before_action :find_user, only:[:edit, :destroy, :update]
    
    def new
        @profile = User.new
        @branches = Branch.all
        render :layout => false
    end
    def create
        @profile = User.new(user_params)
        @branches = Branch.all
        if @profile.save
            session[:user_id] = @profile.id
            session[:branch_id] = current_user.branch_id
            flash[:success] = "User profile created successfully"
            redirect_to pages_path
        else
            render 'new', :layout => false
        end
        
    end
    
    def edit
        @branches = Branch.all
    end

    def update
        @branches = Branch.all
        if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
            params[:user].delete("password")
            params[:user].delete("password_confirmation")
        end
        if @user.update(user_params)
            flash[:success] = "User profile updated successfully"
            case current_user.fullname
            when 'rexsamson'
                redirect_to users_path
            else
                redirect_to pages_path
            end
            
        else
            case current_user.fullname
            when 'rexsamson'
                render 'edit'
            else
                flash[:error] = "An error occurred, please try again"
                redirect_to edit_profile_path(current_user.name)
            end
            
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
        @user = User.friendly.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:name, :fullname, :email, :password, :password_confirmation, :branch_id, :slug )
    end
    
end
