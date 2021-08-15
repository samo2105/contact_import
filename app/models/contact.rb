class Contact < ApplicationRecord
  require 'credit_card_validations/string'
  belongs_to :user
  validates :user_id, :email, :credit_card, :credit_card_encoded, :dob, :phone, :address, :card_franchise, :name, presence: true
  validates :email, uniqueness: { 
    scope: :user_id,
    message: 'Mail existing in user contacts'
  },
  format: {
    with: /(.+)@(.+)\z/, 
    message: 'Format not allowed'
  }
  validates :phone, format: {
    with: /\A\(\+\d{2}\) \d{3}([ -])\d{3}\1\d{2}\1\d{2}\z/,
    message: 'Format not allowed'
  }
  validates :name, format: {
    with: /[A-Za-z0-9 -]+\z/,
    message: 'Format not allowed'
  }
  validate :valid_date?

  def secure_credit_card(card)
    detector = CreditCardValidations::Detector.new(card)
    errors.add(:credit_card, 'Invalid credit card') if !detector.valid?
    length = card.length
    self.card_franchise = card.credit_card_brand_name 
    self.credit_card = ('X' * (length - 4)  + card[length-4, length-1])
    self.credit_card_encoded =  Base64.encode64(card)
  end

  private

  def valid_date?
    begin
      date = dob.to_s
      !!(date.match(/\d{4}-\d{2}-\d{2}/) || date.match(/\d{4}\d{2}\d{2}/) && Date.strptime(date, '%Y-%m-%d') || Date.strptime(date, '%F'))
    rescue
      errors.add(:date, 'Date format not allowed')
    end
  end
end

