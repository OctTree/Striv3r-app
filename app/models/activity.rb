class Activity < ApplicationRecord

  #======================================== Relationships ==============================================================

  belongs_to :user

  #======================================== Validations ================================================================

  validates_presence_of :activity_name, :performed_at
end
