# README

To start a new rails application named todoapp, type in:

```rails new todoapp```

Navigate to todoapp, if you are in rails_projects directory:
```cd todoapp```

To start the server:
```rails s -b $IP -p $PORT```

# STRUCTURE

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

# ROUTES

To create an about page, first create the route in the routes file:

``` get '/about', to: 'pages#about' ```

Then define an about action in pages_controller.rb file:
def about
end

Create a new file called about.html.erb in the views/pages folder and fill it in:
``` <h1>This is the about page</h1> ```

# MIGRATE

Create a migration file to create todos table:
``` rails generate migration create_todos ```

Then within the change method under create_table, fill in the attribute details:
t.string :name
t.text :description

Save this file and then run the migration:
``` rails db:migrate ```

# CONSOLE

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