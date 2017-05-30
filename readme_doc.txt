# Production deploy and start main project app

    To deploy your todoapp to production, create an account with heroku, ensure you confirm the account by clicking on the link in your email address
    
    Then pull up your gemfile, move the sqlite3 gem to group development, test (ensure it's no longer in the top/main area of your gemfile)
    
    Add the following group at the bottom:
    
    group :production do
      gem 'pg'
    end
    
    Then run:
    bundle install --without production
    
    Then do another commit to capture the updates and modify the gemfile.lock file
    git add -A
    git commit -m "make app production ready"
    git push
    
    Then log-in to your heroku account:
    heroku login
    
    Enter in your email and password for your heroku account
    
    Add your public ssh key to your heroku account:
    heroku keys:add
    
    Enter when asked whether to upload public ssh key to heroku: Y
    
    Create a new production app in heroku:
    heroku create
    
    Rename it to something you like:
    heroku rename yourname-todoapp
    
    Deploy your local app to heroku:
    git push heroku master
    
    Then run the migrations in heroku:
    heroku run rails db:migrate
    
    Now check out your app at yourname-todoapp.herokuapp.com
    
    Enjoy with family and friends!
    
    Now let's start our main project app for this course:
    
    Navigate out of todoapp and into rails_projects directory
    
    From there (rails_projects directory), type in:
    rails new myrecipes
    
    This will build the new app
    
    Test it out by typing in:
    cd myrecipes
    
    Then run the rails server:
    rails s -b $IP -p $PORT
    
    Test out that you get the rails main welcome page from the browser, then shut down the server
    
    Initiate a git repo:
    git init
    
    Then make a commit:
    git add -A
    git commit -m "Initial commit"
    
    Create a new repository in your github account, then follow the steps (two lines) to move existing app to your github repo
    
    Then test it out and ensure your app is pointing to the right repo by typing in:
    git remote -v
    
    Reload the github page and ensure your latest commit/project is showing up
--------------------------------------------------------------------------------
# Integration test 

    Create an integration test for the pages:

    rails generate integration_test pages
    
    Then within the class PagesTest, type in the two tests:
    
    test "should get home" do
    get pages_home_url
    assert_response :success
    end
    
    test "should get root" do
    get root_url
    assert_response :success
    end
    
    run your test suite by typing in:
    rails test
    
    Add the two routes to the config/routes.rb file:
    root "pages#home"
    get 'pages/home', to: 'pages#home'
    
    Run the tests again
    
    Build out the pages_controller.rb file under app/controllers folder and add the home action
    
    class PagesController < ApplicationController
    def home
    end
    end
--------------------------------------------------------------------------------
# Create tables and models
    to generate a migration file for recipes:
    rails generate migration create_recipes
    
    Then open the migration file and fill in within the create_table :recipes method
    t.string :name
    t.text :description
    t.timestamps
    
    run the migration to create the table:
    rails db:migrate
    
    create a new file called recipe.rb under app/models folder (for the recipe model) and fill it in:
    class Recipe < ApplicationRecord
    
    end
    
    Test it out in the rails console
    
    to generate a migration file for chefs:
    rails generate migration create_chefs
    
    Then open the migration file and fill in within the create_table :chefs method
    t.string :chefname
    t.string :email
    t.timestamps
    
    run the migration to create the table:
    rails db:migrate
    
    create a new file called chef.rb under app/models folder (for the chef model) and fill it in:
    class Chef < ApplicationRecord
    
    end
--------------------------------------------------------------------------------
# TDD - validations for model
    To correct a prior migration, it's a good idea to create a new migration file. In the prior video we demo how to correct the recipes table by using the following methods:
    
    rename_column :recipes, :email, :description
    
    basically first the table name, then the column name as it stands now (that you want to change) then the new column name
    
    Then we use change_column to change the column type, notice how we refer to it as description here even though we're changing it in the line before in the same migration file
    
    Then we ran the migration using rails db:migrate
    
    Create a new test file for recipe model tests. Under test/models folder create a file named recipe_test.rb
    
    Within it fill it in with the tests:
    
    require 'test_helper'
    
    class RecipeTest < ActiveSupport::TestCase
      
      def setup
        @recipe = Recipe.new(name: "vegetable", description: "great vegetable recipe")  
      end
      
      test "recipe should be valid" do
        assert @recipe.valid?
      end  
      
      test "name should be present" do
        @recipe.name = " "
        assert_not @recipe.valid?
      end
      
      test "description should be present" do
        @recipe.description = " "
        assert_not @recipe.valid?
      end
      
      test "description shouldn't be less than 5 characters" do
        @recipe.description = "a" * 3
        assert_not @recipe.valid?
      end
      
      test "description shouldn't be more than 500 characters" do
        @recipe.description = "a" * 501
        assert_not @recipe.valid?
      end
    end
    
    Fill in the validations in the recipe model:
    
    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 5, maximum: 500 }
--------------------------------------------------------------------------------
# One-to-many 

  Create a new migration file by issuing the following command:
  
  rails generate migration add_chef_id_to_recipes
  
  Pull up the new migration file that is created and fill in within the change method:
  
  add_column :recipes, :chef_id, :integer
  
  Run the migration: rails db:migrate
  
  Test it out in the console
  
  Pull up the chef.rb model file and add in the following line:
  has_many :recipes
  
  Pull up the recipe.rb model file and add in the following line:
  belongs_to :chef
  
  Refer to the video to look for methods, getters setters etc that are available now with this association and how they are used for both chefs and recipes
  
  Update the recipe_test.rb file under test/models folder, change the setup method to look like below and also add a new test that checks for chef_id:
  def setup
    @chef = Chef.create!(chefname: "mashrur", email: "mashrur@example.com")
    @recipe = @chef.recipes.build(name: "vegetable", description: "great vegetable recipe")  
  end
  
  test "recipe without chef should be invalid" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  Add the validation to your recipe.rb model file:
  validates :chef_id, presence: true