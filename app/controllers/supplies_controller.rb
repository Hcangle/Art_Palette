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
     erb :'supplies/index'
    end 

  # Show
    # make a get request to 'supplies/id'

#UPDATE

  # Edit 
    # make a get request to '/supplies/:id/edit'

  # Update
    # make a put(replaces all attributes) or a patch(replaces one or more atributes) request to '/supplies/:id'

#DESTROY

  # make a delete request to '/supplies'

end 