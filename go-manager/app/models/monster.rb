require 'base64'
require 'securerandom'

class Monster < ApplicationRecord

  # Relationships
  belongs_to :user

  # Validation
  validates_format_of :name, with: /\A[A-Za-z0-9]+\z/,
    message: "must contain only alphanumeric characters"


  after_initialize :init


  def init
    # If this is a new Monster, assign a new random slug
    self.slug ||= Base64.urlsafe_encode64(SecureRandom.uuid)
  end

  # Use the slug when constructing a URL to this object
  def to_param  # overridden
    slug
  end

end
