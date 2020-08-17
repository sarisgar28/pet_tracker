class PetsController < ApplicationController
   
    #create
    get '/pets/new' do 
      erb :'/pets/new'
    end 
    
    #read
    get '/pets' do 
        authenticate 
        @pets = current_user.pets.all
        erb :'/pets/new'
    end 
  
    post '/pets' do
      @pet = Pet.new(name: params[:name],age: params[:age],notes: params[:notes])
      if @pet.save
        current_user.pets << @pet
        redirect "/pets/#{@pet.id}"
      else  
        erb :'/pets/new'
      end 
    end

    get '/pets/:id/edit' do
        @pet = Pet.find_by(id: params[:id])
        erb :'/pets/edit'
    end 

    patch '/pets/:id' do 
        @pet = Pet.find_by(id: params[:id])
        @pet.update(name: params[:name],age: params[:age],notes: params[:notes])
        @pet.save
        redirect '/pets'
    end

    get '/pets/:id' do
        @pet = Pet.find_by(id: params[:id])
        erb :'/pets/show'
    end 

    delete '/pets/:id' do 
        @pets = Pet.find_by(id: params[:id])
        @pet.destroy
        redirect '/home'
    end 


end 