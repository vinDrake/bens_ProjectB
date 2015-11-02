class PlayersController < ApplicationController
  before_action :require_player, only: [:index, :show]

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @questions = Question.all
    size = @questions.size
    @player.question_feed = Array.new( 1 + rand(size), 1 + rand(size)).delete_at(0).to_s
    if @player.save
      session[:player_id] = @player.id
      redirect_to '/players'
    else
      redirect_to '/signup'
    end
  end

  def index
    @players = Player.all
  end

  def show
    @session = session
    @player = Player.find(@session[:player_id])
#    @duels = @player.duels
  #  @player = Player.find(params[:id])
    @questions = Question.all
    size = @questions.size
#    @question = Question.find(size )#+ rand(size))
    if @player.question_feed
      @question_feed = @player.question_feed.split(',').collect! {|n| n.to_i}
      # @question_feed << Player.find(session[:player_id]).question_feed.split(',').collect! {|n| n.to_i}
      @player.challenges.each do |c|
        @question_feed += c.questionnaire.split(',').collect! {|n| n.to_i}
      end
    else
      @question_feed = [1]
    end


# => Killing 0 in the Array
    # @question_feed.delete('0')
    @question_feed.uniq!.rotate!
    while @question_feed.size < 20  do
      @question_feed += [1 + rand(size)]
    end
    @player.answers.each do |a|
      if @question_feed.size > 2
        @question_feed.delete(a.question.id)
      end
    end

#    @player.question_feed = @question_feed.to_s
    @player.update(:question_feed => @question_feed)#.to_s)
    @question = Question.find(@question_feed.first)
  end

  def edit
  end

  def update
  end

  private
  def player_params
    params.require(:player).permit(:name, :email, :password)
  end
end
