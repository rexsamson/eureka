class StocksController < ApplicationController
    before_action :require_login
    before_action :find_stock, only:[:edit, :destroy, :show, :update]
    before_action :require_same_branch, only:[:edit, :destroy, :show, :update]
    
    def show
        @inventories = @stock.inventories
    end
    
    def edit
        @products = Product.where(branch_id: Branch.find(session[:branch_id]))
    end
    
    def new
        if last_stock = Stock.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_stock.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @stock = Stock.new
        @products = Product.where(branch_id: Branch.find(session[:branch_id]))
        2.times { @stock.inventories.build }
        @stock.code= "#{"INV"}#{sprintf("%05d", new_code_number)}"
        @stock.branch = Branch.find(session[:branch_id])
    end
    
    def create
        if last_stock = Stock.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_stock.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @stock = Stock.new(stock_params)
        @stock.branch = Branch.find(session[:branch_id])
        @stock.code= "#{"INV"}#{sprintf("%05d", new_code_number)}"
        @products = Product.where(branch_id: Branch.find(session[:branch_id]))
        if @stock.save
            flash[:success] = "Stock data created successfully!"
            redirect_to stocks_path
        else
            render 'new'
        end
    end
    
    def destroy
        @stock.destroy
        flash[:warning] = "Stock data deleted successfully!"
        redirect_to stocks_path
    end
    
    def update
    if @stock.update(stock_params)
        flash[:success] = "Stock data updated successfully!"
        redirect_to stocks_path
    else
        render 'edit'
    end
    
    end
    
    def index
        @stocks= Stock.where(branch_id: current_branch)
        if params[:search]
            @stocks = Stock.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 30)
        else
            @stocks = Stock.where(branch_id: current_branch).order('created_at DESC').paginate(page: params[:page], per_page: 30)
        end
    end
    
    private
    
    def find_stock
        @stock = Stock.friendly.find(params[:id])
    end
    
    def stock_params
        params.require(:stock).permit(
            :code,
            :date, 
            :status, 
            :description,
            :menu,
            :branch_id, 
            :slug,
            inventories_attributes: Inventory.attribute_names.map(&:to_sym).push(:_destroy)
        )
        #params.require(:todo_list).permit(:name, tasks_attributes: Task.attribute_names.map(&:to_sym).push(:_destroy))
    end
    
    def require_same_branch
        if current_user.branch_id != @stock.branch_id
            flash[:error]  = "You dont have permision for this action!"
            redirect_to stocks_path
        end
    end
   
end
    