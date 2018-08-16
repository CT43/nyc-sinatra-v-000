class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.new(name: params[:name])
    @figure.title = Title.find_or_create_by(name: params[:name])
    @figure.title_ids = params[:title_ids]
    @figure.landmark = Title.find_or_create_by(name: params[:name])
    @figure.landmark_ids = params[:landmark_ids]
    @figure.save

end
