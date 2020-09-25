class SuppliesController < ApplicationController

  get '/supplies' do
    if logged_in?
      @supplies = current_user.supplies
      erb :'/supplies/index'
    else
      redirect to '/login'
    end
  end
  
    
    # New 
      # make a get request to '/supplies/new'
  
      
      get '/supplies/new' do 
        if logged_in?
          erb :'/supplies/new'
        else 
          redirect to '/login'
        end 
      end 
  
    
    # Create
      # make a post request to '/supplies'
      post '/supplies' do 
        @supplies = current_user.supplies.build(name: params[:name], brand: params[:brand])
        
         if @supplies.save
        
          #erb :'/supplies/show'
          redirect to "/supplies/#{@supplies.id}"
        else 
         
          redirect to '/supplies/new'
       end 
      end
    
  
      
  
    # Show
      # make a get request to 'supplies/id'
  
      get '/supplies/:id' do 
       if logged_in?
        @supplies = Supply.find_by_id(params[:id])
         erb :'/supplies/show'
       else 
        redirect to '/login'
      end 
     end 
      
     #binding.pry
  
    # Edit 
      # make a get request to '/supplies/:id/edit'
  
      get '/supplies/:id/edit' do 
        if logged_in?
        @supplies = Supply.find_by_id(params[:id])
        if @supplies && @supplies.user == current_user
         erb :'/supplies/edit'
        else 
          erb :'/supplies/index'
        #redirect to '/supplies'
        end
      else 
       redirect to '/login'
      end 
   end


    # Update
      # make a put(replaces all attributes) or a patch(replaces one or more atributes) request to '/supplies/:id'
  
      patch '/supplies/:id' do 
      if logged_in? 
        if params[:name] && params[:brand] == ""
          redirect to "/supplies/#{params[:id]}/edit"
        else
          @supplies = Supply.find_by_id(params[:id])
          if @supplies && @supplies.user == current_user
            if @supplies.update(name: params[:name], brand: params[:brand])
              redirect to "/supplies/#{@supplies.id}"
            else
              redirect to "/supplies/#{@supplies.id}/edit"
            end
          else
            redirect to '/supplies'
          end
        end
      else
        redirect to '/login'
      end
    end
  #DESTROY
    # make a delete request to '/supplies'

    delete '/supplies/:id/delete' do
      if logged_in?
        @supplies = Supply.find_by_id(params[:id])
        if @supplies && @supplies.user == current_user
          @supplies.delete
        
        redirect to '/supplies'
        end
      else
        redirect to '/login'
      end
    end
  end