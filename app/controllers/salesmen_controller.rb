class SalesmenController < ApplicationController
    before_action :require_login
    before_action :find_salesman, only:[:edit, :destroy, :show, :update]
    before_action :require_same_branch, only:[:edit, :destroy, :show, :update]

    def show
        @targets = @salesman.targets
    end
    
    def edit
        #@salesman.targets.build
    end
    
    def new
        if last_salesman = Salesman.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_salesman.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @salesman = Salesman.new
        #3.times { @salesman.targets.build }
        @salesman.targets.build
        @salesman.code= "#{"SAL"}#{sprintf("%05d", new_code_number)}"
        @salesman.branch = Branch.find(session[:branch_id])
    end
    
    def create
        if last_salesman = Salesman.where(:branch_id => Branch.find(session[:branch_id])).last
            last_code_number = last_salesman.code.scan(/\d+$/).first.to_i
            new_code_number = last_code_number + 1
        else
            new_code_number = 1
        end
        @salesman = Salesman.new(salesman_params)
        @salesman.branch = Branch.find(session[:branch_id])
        @salesman.code= "#{"SAL"}#{sprintf("%05d", new_code_number)}"
        
        if @salesman.save
            flash[:success] = "Salesman data created successfully!"
            redirect_to salesmen_path
        else
            render 'new'
        end
    end
    
    def destroy
        @salesman.destroy
        flash[:warning] = "Salesman data deleted successfully!"
        redirect_to salesmen_path
    end
    
    def update
    if @salesman.update(salesman_params)
        flash[:success] = "Salesman data updated successfully!"
        redirect_to salesmen_path
    else
        render 'edit'
    end
    
    end
    
    def index
        @salesmen= Salesman.where(branch_id: current_branch)
    end
    
    private
    
    def find_salesman
        @salesman = Salesman.friendly.find(params[:id])
    end
    
    def salesman_params
        params.require(:salesman).permit(
            :code, :name, :dbirth, :identity, :status, :branch_id, :slug,
            targets_attributes: Target.attribute_names.map(&:to_sym).push(:_destroy)
        )
    end
    
    def require_same_branch
        if current_user.branch_id != @salesman.branch_id
            flash[:error]  = "You dont have permision for this action!"
            redirect_to accounts_path
        end
    end
    
end
    