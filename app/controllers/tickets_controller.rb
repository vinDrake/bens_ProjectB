class TicketsController < ApplicationController
  before_action :require_player, only: [:index, :show]

  def new
    @challenge_select = Challenge.all
    @ticket = Ticket.new
  end

  def create
    @challenge = Challenge.find(ticket_params[:challenge_id])
    @ticket = @challenge.tickets.create(ticket_params)
    if @ticket.save
      # @question_feed = Array.new
      # @question_feed << Player.find(session[:player_id]).question_feed.split(',').collect! {|n| n.to_i}
      # @question_feed << @challenge.questionnaire.split(',').collect! {|n| n.to_i}
      redirect_to challenge_path(@challenge)
    else
      render 'new'
    end
  end

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private
  def ticket_params
    tp = params.require(:ticket).permit(:player_id, :challenge_id, :complete, :end_time)
    tp[:player_id] = session[:player_id]
    return tp
  end
end
