module BxBlockCustomUserSubs
	class StudyFormat < ApplicationRecord
		self.table_name = :study_formats

		has_one_attached :logo

		validates :name, presence: true
		validates :logo, presence: true

		enum name: %i[1-on-1 Group]
	end
end
