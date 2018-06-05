class PersonalityProfile < ApplicationRecord
  has_many :dimensions, dependent: :destroy
  has_many :needs, dependent: :destroy
  has_many :values, dependent: :destroy
  has_many :saved_profiles

  def is_valid?
    error_message.nil?
  end
end
