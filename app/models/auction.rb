class Auction < ApplicationRecord

  belongs_to :user, optional: true

  has_many :bids, dependent: :destroy
  has_many :users, through: :bids



  include AASM

  aasm whiny_transitions: false do
    state :draft, initial: true
    state :published
    state :cancelled
    state :won
    state :reserve_not_met
    state :reserve_met

    event :publish do
      transitions from: :draft, to: :published
    end

    event :win do
      transitions from: :published, to: :won
    end

    event :cancel do
      transitions from: [:draft, :published, :won], to: :cancelled
    end

    event :meet_reserve do
      transitions from: :published, to: :reserve_met
    end
  end

  private

  def set_reserved_default
    self.reserve_price ||= 1
  end

  def set_price_default
    self.current_price ||= 0
  end
end
