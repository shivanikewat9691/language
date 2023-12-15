class BxBlockLandingpage3::FrequentlyAskedQuestion < ApplicationRecord
  self.table_name = :bx_block_landingpage3_frequently_asked_questions
  validates :title, presence: true
  validates :description, presence: true
end
