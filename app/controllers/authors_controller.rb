class AuthorsController < ApplicationController
  def new
  end

  def create
    render plain: params[:author].inspect
  end
end
