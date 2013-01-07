class Score < ActiveRecord::Base
  attr_accessible :nickname, :score
  has_many :scores, :order => "score DESC"

  validates :nickname, :score, :presence => true
  validates :nickname, :length => { :minimum => 3 }
end
