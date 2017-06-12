class SessionsController < ApplicationController

    def new
        if logged_in?
        redirect_to pages_path
        else 
        render :layout => false
        session[:user_id] = nil
        session[:branch_id] = nil
        end
    end
    
    def create
        user = User.find_by(name: params[:session][:name].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            session[:branch_id] = user.branch_id
            
            flash[:success] = "You've been logged in successfully!"
            redirect_to pages_path
        else
            flash[:danger] = "Invalid username or password information !"
            render 'new', :layout => false
        end
    end
    
    def destroy
        session[:user_id] = nil
        session[:branch_id] = nil
        flash[:success] = "You've been logged out successfully !"
        redirect_to login_path
    end

end