class MoviesController < ApplicationController
  before_action :require_login
  
  def index
      @user = User.find(params[:id])
      @movies = Movie.all
  end

  def show
      @user = User.find(params[:user_id])
      @movie = Movie.find(params[:id])
  end
end
