class SuppliesController < ApplicationController

#CREATE
  
  # New 
    # make a get request to '/supplies/new'
  
  # Create
    # make a post request to '/supplies'

#READ
  
  # Index
    # make a get request to '/supplies'
    
    get '/supplies' do 
      @supplies = Supply.all
     erb :'supplies/index'
    end 

  # Show
    # make a get request to 'supplies/id'

    get '/supplies/:id' do 
      @supply = Supplies.find(params["id"])
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