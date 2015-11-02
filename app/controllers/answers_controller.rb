class AnswersController < ApplicationController
  before_action :require_player, only: [:index, :show]

  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    if @answer.save
      redirect_to player_path(session[:player_id])
    else
      render 'new'
    end
  end

  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  private
  def answer_params
    ap = params.require(:answer).permit(:correct, :question_id, :player_id, :guess)
    if ap[:guess] == @question.correct_answer
      ap[:correct] = "t"
    else
      ap[:correct] = "f"
    end
    return ap
  end
end
