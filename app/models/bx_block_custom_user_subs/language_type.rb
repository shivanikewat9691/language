module BxBlockCustomUserSubs
	class LanguageType < ApplicationRecord
		self.table_name = :language_types

		has_one_attached :logo

		validates :name, presence: true
		validates :logo, presence: true

		enum name: %i[Everyday Business]
	end
end
