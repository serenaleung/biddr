class User < ApplicationRecord
  has_secure_password
  
  has_many :auctions, dependent: :destroy
  has_many :bids, dependent: :destroy

  has_many :watches, dependent: :destroy
  has_many :watched_auctions, through: :watches, source: :auction


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence:true
  validates :email, presence:true,
                    uniqueness: { case_sensitive: false },
                    format: VALID_EMAIL_REGEX
  before_validation :downcase_email

  private

  def downcase_email
    self.email.downcase! if email.present?
  end
end
