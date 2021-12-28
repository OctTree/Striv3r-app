class ActivityPlan < ApplicationRecord

  #====================================== Relationships ===============================================================

  belongs_to :user

  #===================================== Enum =========================================================================

  enum week: ["week 1", "week 2", "week 3", "week 4", "week 5"]
  enum status: ["unapproved", "approved"]

  #===================================== Callback ====================================================================

  before_create :set_remaining_time

  #=================================== Methods ======================================================================

  def set_remaining_time
    self.remaining_time = (time * 60)
  end
end
