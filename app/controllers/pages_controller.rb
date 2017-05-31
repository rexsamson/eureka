class PagesController < ApplicationController

def home
    
end

def main
   
end

def login
   render :layout => false
end

private
def user_params
    params.require(:user).permit(:name, :fullname, :email, :password, :password_digest, :branch_id )
 
end
     

end
