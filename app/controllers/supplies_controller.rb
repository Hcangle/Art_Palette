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
        
          if params[:image] !="" 
           @supplies.update(image: params[:image])
           
          end
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
           @supplies = Supply.find(params[:id])
           if @supplies && @supplies.user == current_user
              if @supplies.update(params[:supplies])
               redirect to "/supplies/#{@supplies.id}"
            else
              @error= "Invalid entry. Please try again."
               erb :"supplies/edit"
             end
           else
            
             redirect to '/supplies'
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