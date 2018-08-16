class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.new(params["landmark"])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
      @figure.update(params[:figure])
      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end

      if !params[:title][:name].empty?
        @figure.titles << Title.create(params[:title])
      end

      @figure.save
      redirect to "/figures/#{@figure.id}"
  end

end
