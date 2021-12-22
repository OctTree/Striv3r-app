class ActivityPlan < ApplicationRecord

  #====================================== Relationships ===============================================================

  belongs_to :user

  #===================================== Enum =========================================================================

  enum week: ["week 1", "week 2", "week 3", "week 4"]
  enum status: ["unapproved", "approved"]
end
