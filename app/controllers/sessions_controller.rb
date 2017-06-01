class SessionsController < ApplicationController

    def new
        if logged_in?
        redirect_to pages_path
        else 
        render :layout => false
        end
    end
    
    def create
        user = User.find_by(name: params[:session][:name].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            session[:user_branch_id] = current_user.branch_id
            
            flash[:success] = "Login successfully. Welcome to Acura application !"
            redirect_to user
        else
            flash[:danger] = "Invalid username or password information !"
            render 'new', :layout => false
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "You've been logged out successfully !"
        redirect_to login_path
    end

end