class SuppliesController < ApplicationController

  get '/supplies' do
    if logged_in?
      @supplies = Supply.all.reverse
      erb :'supplies/index'
    else
      redirect to '/login'
    end
  end
  
  #CREATE
    
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
      if logged_in?
        supply = Supply.new(params)
        if !supply.name.empty? && !supply.brand.empty?
          supply.save
          # take user to supply index page 
          redirect '/supplies'
        else 
          # rerender the form
          @error = "Data invalid. Please input data correctly."
          erb :'/supplies/new'
       end 
      
      else 
        redirect to '/login'
      end
    end
    
  #READ
      
  
    # Show
      # make a get request to 'supplies/id'
  
      get '/supplies/:id' do 
       if logged_in?
        @supply = Supply.find_by_id(params[:id])
        erb :'supplies/show'
       else 
        redirect to '/login'
      end 
     end 
      
  
  #UPDATE
  
    # Edit 
      # make a get request to '/supplies/:id/edit'
  
      get '/supplies/:id/edit' do 
       if logged_in?
        @supply = Supply.find_by_id(params[:id])
        if @supply && @supply.user == current_user
        erb :'/supplies/edit'
        else 
          redirect to '/supplies'
        end
      else 
        redirect to '/login'
      end 
    end


    # Update
      # make a put(replaces all attributes) or a patch(replaces one or more atributes) request to '/supplies/:id'
  
      patch '/supplies/:id' do 
      if logged_in? 
        if params[:content] == ""
          redirect to "/supplies/#{params[:id]}/edit"
        else
          @supply = Supply.find_by_id(params[:id])
          if @supply && @supply.user == current_user
            if @supply.update(content: params[:content])
              redirect to "/supplies/#{@supply.id}"
            else
              redirect to "/supplies/#{@supply.id}/edit"
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
    delete '/supples/:id/delete' do
      if logged_in?
        @supply = Supply.find_by_id(params[:id])
        if @supply && @supply.user == current_user
          @supply.delete
        end
        redirect to '/supplies'
      else
        redirect to '/login'
      end
    end
  end