class ProfilesController < ApplicationController
    before_action :find_user, only:[:edit]
    before_action :require_login, except:[:new, :create]
    before_action :require_same_user, only:[:show, :edit, :update]
    
    def show 
        @user = User.friendly.find(params[:id])
    end
    
    def edit
        
    end

    
    
    private
    
    def find_user
        @user = User.friendly.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:name, :fullname, :email, :password, :password_digest, :branch_id, :slug )
    end
    
    def require_same_user
        if current_user != User.friendly.find(params[:id])
            flash[:error]  = "You dont have permision for this action!"
            redirect_to pages_path
        end
        
    end
end
