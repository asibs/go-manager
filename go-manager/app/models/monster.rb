require 'base64'
require 'securerandom'

class Monster < ApplicationRecord

  # Relationships
  belongs_to :user
  has_many :monster_evolutions

  # Accepts nested attributes
  accepts_nested_attributes_for :monster_evolutions

  # Validation
  validates_presence_of :user_id
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
