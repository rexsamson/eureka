class SalesmenController < ApplicationController

    before_action :find_salesman, only:[:edit, :destroy, :show, :update]
    
    def show 
    end
    
    def edit
    end
    
    def update
        @salesman.update(salesman_params)
        flash[:notice] = "Salesman data updated successfully"
        redirect_to salesmen_path
    end
    
    def new
        @salesman = Salesman.new
    end
    
    def create
        @salesman = Salesman.new(salesman_params)
        @salesman.branch = Branch.first
        if @salesman.save
            flash[:notice] = "Salesman data created successfully!"
            redirect_to salesmen_path
        else
            render 'new'
        end
    end
    
    def destroy
        @salesman.destroy
        flash[:notice] = "Salesman data deleted successfully"
        redirect_to salesmen_path
    end
    
    def index
        @salesmen = Salesman.all
    end
    
    private
    
    def find_salesman
        @salesman = Salesman.find(params[:id])
    end
    
    def salesman_params
      params.require(:salesman).permit(:code, :name, :dbirth, :identity, :status )
    end
end
