class PointRedeem < ApplicationRecord

  #============================================= Relationships =========================================================

  belongs_to :user

  #=========================================== Validations =============================================================

  validates_presence_of :redeemed_point
end
