module BxBlockLandingpage3 
  class Language < ApplicationRecord
    self.table_name = :languages

    has_one_attached :logo

    validates :language_name, presence: true
    validates :logo, presence: true

    enum language_name: %i[English German Spanish French Portuguese Brazilian_Portuguese]
  end
end
