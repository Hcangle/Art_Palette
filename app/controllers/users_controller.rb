class UsersController < ApplicationController
   
    
      get '/signup' do
        if !logged_in?
          erb :'/users/signup'
        else
          redirect to '/supplies'
        end
      end
    
      post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
           @error = "Data invalid. Please try again." 
          erb :'/users/signup'
        else
          @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
          @user.save
          session[:user_id] = @user.id
          redirect to '/supplies'
          
        end
      end
    
      get '/login' do
        if !logged_in?
          erb :'/users/login'
        else
          redirect to '/supplies'
        end
      end
    
      post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect to '/supplies'
        else
          @error= "Invalid entry. Please try again."
          erb :'/users/login'
        end
      end
    
      get '/logout' do
        if logged_in?
          session.destroy
          redirect to '/login'
        else
          redirect to '/'
        end
      end
end