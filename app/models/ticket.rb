class Ticket < ActiveRecord::Base
  belongs_to :player
  belongs_to :challenge
end
