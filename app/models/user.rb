class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :cuis
  has_many :contests, through: :cuis
  before_save { self.email = email.downcase }
  before_save { self.password = BCrypt::Password.create(self.password) }
  validates :handle,  presence: true, length: { maximum: 50 },
                    uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  def password?(pass)
     BCrypt::Password.new(self.password) == pass
  end
  
end
