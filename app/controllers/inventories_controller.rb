class InventoriesController < ApplicationController
    before_action :require_login
    before_action :find_journal, only:[:edit, :destroy, :show, :update]
    before_action :require_same_branch, only:[:edit, :destroy, :show, :update]
    
    def show
        @ledgers = @journal.ledgers
    end
    
    def edit
        @accounts = Account.where(branch_id: Branch.find(session[:branch_id]))
    end
    
    def new
        if last_journal = Inventory.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_journal.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @journal = Inventory.new
        @accounts = Account.where(branch_id: Branch.find(session[:branch_id]))
        2.times { @journal.ledgers.build }
        @journal.code= "#{"AJP"}#{sprintf("%05d", new_code_number)}"
        @journal.branch = Branch.find(session[:branch_id])
    end
    
    def create
        if last_journal = Inventory.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_journal.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @journal = Inventory.new(journal_params)
        @journal.branch = Branch.find(session[:branch_id])
        @journal.code= "#{"AJP"}#{sprintf("%05d", new_code_number)}"
        
        if @journal.save
            flash[:success] = "Inventory data created successfully!"
            redirect_to inventories_path
        else
            render 'new'
        end
    end
    
    def destroy
        @journal.destroy
        flash[:warning] = "Inventory data deleted successfully!"
        redirect_to inventories_path
    end
    
    def update
    if @journal.update(journal_params)
        flash[:success] = "Inventory data updated successfully!"
        redirect_to inventories_path
    else
        render 'edit'
    end
    
    end
    
    def index
        @inventories= Inventory.where(branch_id: current_branch)
        if params[:search]
            @inventories = Inventory.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 30)
        else
            @inventories = Inventory.where(branch_id: current_branch).order('created_at DESC').paginate(page: params[:page], per_page: 30)
        end
    end
    
    private
    
    def find_journal
        @journal = Inventory.friendly.find(params[:id])
    end
    
    def journal_params
        params.require(:journal).permit(
            :code,
            :date, 
            :status, 
            :description,
            :total,
            :branch_id, 
            :slug,
            ledgers_attributes: Ledger.attribute_names.map(&:to_sym).push(:_destroy)
        )
        #params.require(:todo_list).permit(:name, tasks_attributes: Task.attribute_names.map(&:to_sym).push(:_destroy))
    end
    
    def require_same_branch
        if current_user.branch_id != @journal.branch_id
            flash[:error]  = "You dont have permision for this action!"
            redirect_to inventories_path
        end
    end
   
end