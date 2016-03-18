class Game < ActiveRecord::Base
  belongs_to :user
  has_many :players, :dependent => :destroy
end