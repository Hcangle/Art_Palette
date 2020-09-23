class SuppliesController < ApplicationController

#CREATE
  
  # New 
    # make a get request to '/supplies/new'

    
    get '/supplies/new' do 
        erb :'/supplies/new'
    end 

  
  # Create
    # make a post request to '/supplies'
    post '/supplies' do 
      supply = Supply.new(params)
      if !supply.name.empty?
        supply.save
        # take user to supply index page 
        redirect '/supplies'
      else 
        # rerender the form
        @error = "Data invalid. Please input name of supply."
        erb :'/supplies/new'
     end 
    end
#READ
  
  # Index
    # make a get request to '/supplies'
    
    get '/supplies' do 
      @supplies = Supply.all.reverse
     erb :'supplies/index'
    end 

  # Show
    # make a get request to 'supplies/id'

    get '/supplies/:id' do 
      @supply = Supply.find(params["id"])
      erb :'supplies/show'
    end 

#UPDATE

  # Edit 
    # make a get request to '/supplies/:id/edit'

  # Update
    # make a put(replaces all attributes) or a patch(replaces one or more atributes) request to '/supplies/:id'

#DESTROY

  # make a delete request to '/supplies'

end 