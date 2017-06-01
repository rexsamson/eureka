class PagesController < ApplicationController

    def home
        if logged_in?
            redirect_to pages_path 
        else
            redirect_to login_path 
        end
    end
    
    def main
       
    end

     

end
