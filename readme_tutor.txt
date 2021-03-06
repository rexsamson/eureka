# README

To start a new rails application named todoapp, type in:

```rails new todoapp```

Navigate to todoapp, if you are in rails_projects directory:
```cd todoapp```

To start the server:
```rails s -b $IP -p $PORT```

# Structure

To display hello world at root route, open the config/routes.rb file and enter in the following route:
```root "application#hello"```

Then in the application controller under the line protect_from_forgery.. add the following method:

def hello
  render plain: "hello world!"
end

save it, start the server (if you haven't already) and reload the page


Now to actually have a home page utilizing the controller and views (instead of rendering text like above):

change the routes.rb file line to
```root "pages#home"```

create a new file under controllers and call it pages_controller.rb, then fill it in:
class PagesController < ApplicationController
  def home
  end
end

create a new folder under views called pages
within this pages folder under views, create a new file called home.html.erb then fill it in with the following:
```<h1>Hello World!</h1> ```

To shut down the server:
``` ctrl-c ```

# Routes

To create an about page, first create the route in the routes file:

``` get '/about', to: 'pages#about' ```

Then define an about action in pages_controller.rb file:
def about
end

Create a new file called about.html.erb in the views/pages folder and fill it in:
``` <h1>This is the about page</h1> ```

# Migrate

Create a migration file to create todos table:
``` rails generate migration create_todos ```

Then within the change method under create_table, fill in the attribute details:
t.string :name
t.text :description

Save this file and then run the migration:
``` rails db:migrate ```

# Console

To start the rails console:
``` rails console ```

To exit the rails console:
``` exit ```

# Git
To read more about git:

https://git-scm.com

If you don't already have git setup in your local environment, set it up by the next two steps:
``` git config --global user.name "Your name"``` 
``` git config --global user.email "Your email address"``` 

To initialize a git repo for your app, from the app's directory type in:
``` git init``` 

Then add all the files for staging:
``` git add -A``` 

Then make a commit and save all the changes with a message:
``` git commit -m "Inital commit"``` 

To show your public ssh key, type in:
``` cat ~/.ssh/id_rsa.pub``` 

Copy paste this to the settings->SSH section of your github account

To create a new repository in github, click on the + sign on top right menu, then select new repository, give it a name, click on create repository, select from existing repository:
``` git remote add origin git@github.com:yourrepositoryname``` 
``` git push -u origin master``` 

github repo: github.com/repo

Save your work:
git add -A
then 
git commit -m "Add edit and update feature"
then
git push 

# New / Create
Fill in the new.html.erb form:

```<h1>Create a new Todo</h1>```

<%= form_for @todo do |f| %>

<p>
  <%= f.label :name %><br>
  <%= f.text_field :name %>
</p>

<p>
  <%= f.label :description %><br>
  <%= f.text_area :description %>
</p>

<p>
  <%= f.submit %>
</p>

<% end %>

Fill in the create action and todo_params methods in the todos_controller.rb file:

def create
  @todo = Todo.create(todo_params)
  if @todo.save
    redirect_to todo_path(@todo)
  else
    render 'new'
  end    
end 

Then add in a private below all other methods and above the last end of file, then create the todo_params method under it:

private

def todo_params
  params.require(:todo).permit(:name, :description)
end

To display errors, add in the following code to the top of the new.html.erb form:
<br />
<% if @todo.errors.any? %><br />
```<h2>The following errors prevented the todo from being saved</h2>```<br />
```<ul>```<br />
<% @todo.errors.full_messages.each do |msg| %><br />
```<li>``` <%= msg %> ```</li>```<br />
<% end %><br />
```</ul>```<br />
<% end %>

# Edit / Update

First fill in the edit action in the todos_controller.rb file

```def edit```
  @todo = Todo.find(params[:id])
end

Create an edit.html.erb file under the views/todos folder and fill it in with the contents of the new.html.erb except the heading (first line) which should be:
```<h1>Edit an existing todo</h1>```

The rest should be identical to the new.html.erb file

# Destroy & Refactor
Add the delete link to the index.html.erb page under the links for edit and show:

<td><%= link_to 'delete', todo_path(todo), method: :delete, 
                                 data: { confirm: "Are you sure?"} %></td>

Add the destroy action in the todos_controller.rb file:

def destroy
  @todo = Todo.find(params[:id])
  @todo.destroy
  flash[:notice] = "Todo was deleted successfully"
  redirect_to todos_path
end

Try a short form of the destroy action and see if it works:

def destroy
  Todo.find(params[:id]).destroy
end

Update application.html.erb and change the code for the flash messages block to read:
<%= render 'layouts/messages' %>

Refactor code:
<%= render 'form' %>

Add a before action to remove some common code in the todos_controller

class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :show, :destroy]
  
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo was created successfully!"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @todo.update(todo_params)
      flash[:notice] = "Todo was successfully updated"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end
  
  def index
    @todos = Todo.all
  end
  
  def destroy
    @todo.destroy
    flash[:notice] = "Todo was deleted successfully"
    redirect_to todos_path
  end
  
  private
  
    def set_todo
      @todo = Todo.find(params[:id])
    end
  
    def todo_params
      params.require(:todo).permit(:name, :description)
    end

end