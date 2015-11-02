class Challenge < ActiveRecord::Base
  has_many :tickets
  has_many :players, through: :ticktes
end
