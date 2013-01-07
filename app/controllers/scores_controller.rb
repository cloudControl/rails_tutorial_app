class ScoresController < ApplicationController
  def game
  	@score = Score.new
  end
  def index
  	@scores = Score.order("score DESC").all
  end

  def show
  	@entry = Score.find(params[:id])
  end

  def new
    @value = cookies[:hsk4shhca]
  	@score = Score.new
  end

  def create
  	@score = Score.new(params[:score])

    if @score.save
      redirect_to scores_path, :notice => "Your score was saved"
    else
      render "new"
    end
  end

  def edit
    @value = cookies[:hsk4shhca]
  	@score = Score.find(params[:id])
  end

  def update
  	@score = Score.find(params[:id])

    if @score.update_attributes(params[:score])
      redirect_to scores_path, :notice => "Your score has been set"
    else
      render "edit"
    end
  end

  def destroy
  	@score = Score.find(params[:id])
    @score.destroy
    redirect_to scores_path
  end
end
