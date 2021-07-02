class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end
  
  # use this instead of email_changed? for Rails = 5.1.x
  def will_save_change_to_email?
    false
  end
  
end
