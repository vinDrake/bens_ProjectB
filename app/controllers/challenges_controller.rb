class ChallengesController < ApplicationController
  before_action :require_player, only: [:index, :show]

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
   if @challenge.questionnaire

   else
      @challenge.questionnaire = [1,2,3,4]
   end
    if @challenge.save
      redirect_to challenges_path
    else
      render 'new'
    end
  end

  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])

    if @challenge.questionnaire
      @questionnaire = @challenge.questionnaire.split(',').collect! {|n| n.to_i}
    else
      @questionnaire = [1]
    end
  end

  private
  def challenge_params
     cp = params.require(:challenge).permit(:name, :alive, :questionnaire)
     cp[:alive] = "t"
     return cp
  end
end
