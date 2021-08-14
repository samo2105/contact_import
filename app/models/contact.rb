class Contact < ApplicationRecord
  belongs_to :user
  validates :user_id, :email, :credit_card, :dob, :phone, :address, :card_franchise, :name, presence: true
  validates :email, uniqueness: { 
    scope: :user_id,
    message: 'Mail existing in user contacts'
  },
  format: {
    with: /^(.+)@(.+)$/, 
    message: 'Format not allowed'
  }
  validates :credit_card, credit_card_number: true
  validates :phone, format: {
    with: /\A\(\+\d{2}\) \d{3}([ -])\d{3}\1\d{2}\1\d{2}\z/,
    message: 'Format not allowed'
  }
  validates :name, format: {
    with: /^[A-Za-z0-9 -]+$/,
    message: 'Format not allowed'
  }

  def valid_date?(string)
    return true if string == 'never'

    !!(string.match(/\d{4}-\d{2}-\d{2}/) || string.match(/\d{4}\d{2}\d{2}/) && Date.strptime(string, '%Y-%m-%d') || Date.strptime(string, '%F'))
    rescue ArgumentError
      false
    end
  end
end
