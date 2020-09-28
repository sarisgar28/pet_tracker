class PetsController < ApplicationController
   
    
    #1-read
    get '/pets' do 
        authenticate 
        @pets = current_user.pets.all
        erb :'/pets/dashboard'
    end 

     
    #new action
    get '/pets/new' do 
      erb :'/pets/new'
    end 

    #Create Action
    post '/pets' do
      @pet = Pet.new(name: params[:name],age: params[:age],notes: params[:notes])
      if @pet.save
        current_user.pets << @pet
        redirect "/pets/#{@pet.id}"
      else  
        erb :'/pets/new'
      end 
    end
    #show action 
    get '/pets/:id' do
      @pet = Pet.find_by(id: params[:id])
      erb :'/pets/show'
    end 

    #Edit action 
    get '/pets/:id/edit' do
        @pet = Pet.find_by(id: params[:id])
        dont_edit 
        erb :'/pets/edit'
    end 
    #Update
    patch '/pets/:id' do 
        @pet = Pet.find_by(id: params[:id])
       dont_edit
        @pet.update(name: params[:name],age: params[:age],notes: params[:notes])
        @pet.save
        redirect '/pets'
    end

    #Destroy action
    delete '/pets/:id' do 
        @pet = Pet.find_by(id: params[:id])
        dont_edit
        @pet.destroy
        redirect '/pets'
    end 

    post '/pets/search' do 
       @pet = Pet.find_by(name: params[:search])
       if current_user && @pet
        erb :'/pets/show'
      else
       redirect '/pets'
      
       end 
   end 
end 