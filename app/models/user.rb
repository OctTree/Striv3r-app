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

  #================================= Callbacks =================================

  before_create :set_role, if: -> { role_id.blank? }

  #================================= Methods ====================================

  def set_role
    self.role = Role.find_by(name: "user")
  end
end
