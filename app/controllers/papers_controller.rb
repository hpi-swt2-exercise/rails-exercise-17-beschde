class PapersController < ApplicationController
  def index
    @papers = Paper.all
  end

  def show
    @paper = Paper.find(params[:id])
  end

  def new
    @paper = Paper.new
  end

  def edit
    @paper = Paper.find(params[:id])
  end

  def create
    @paper = Paper.new(paper_params)
  end

  def update
    @paper = Paper.find(params[:id])
  end

  def destroy
    @paper = Paper.find(params[:id])
  end

  private
  def paper_params
    params.require(:paper).permit(:title, :venue, :year)
  end
end
