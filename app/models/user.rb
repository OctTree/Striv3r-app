class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #==================================== Validations =============================

  validates_presence_of :name, :zip

  #================================== Relationships ============================
  belongs_to :role
  has_many :blacklisted_tokens, dependent: :destroy
  has_many :refresh_tokens, dependent: :destroy
  has_many :plans, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :activity_plans, dependent: :destroy

  #=================================== Nested Attributes ======================

  accepts_nested_attributes_for :activity_plans

  #================================= Callbacks =================================

  before_create :set_role, if: -> { role_id.blank? }
  before_create :set_referral_code

  #================================= Methods ====================================

  def set_role
    self.role = Role.find_by(name: "user")
  end

  def set_referral_code
    self.referral_code = SecureRandom.hex.first(5)
  end
end
