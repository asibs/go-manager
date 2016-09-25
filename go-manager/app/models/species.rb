class Species < ApplicationRecord

  # Statically load & cache species data, since it's static data anyway
  @@cached_all = Species.all
  def self.cached_all
    @@cached_all
  end

  def translated_name
    I18n.t(name)
  end

end
