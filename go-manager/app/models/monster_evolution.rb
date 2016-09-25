class MonsterEvolution < ApplicationRecord

  # Relationships

  # Unfortunately we need to make this relationship optional,
  # otherwise validation fails when creating a Monster & MonsterEvolution
  # at the same time (see: http://stackoverflow.com/questions/39687247/)
  belongs_to :monster, optional: true

  belongs_to :species


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
