class QuestionsController < ApplicationController
  before_action :require_player, only: [:index, :show]

  def new
    @question= Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to '/questions'
    else
      render 'new'
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @session = session
    @player = Player.find(@session[:player_id])#params[:player_id])
    @question = Question.find(params[:id])
    @answers = [ @question.correct_answer, @question.wrong_answers ]
  end

  def edit
  end

  def update
  end

  private
  def question_params
    params.require(:question).permit(:problem, :correct_answer, :wrong_answers, :category)
  end
end
