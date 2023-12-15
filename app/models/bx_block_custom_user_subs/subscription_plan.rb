module BxBlockCustomUserSubs
  class SubscriptionPlan < ApplicationRecord
    self.table_name = :subscription_plans
    has_one_attached :logo
    
    validates :name, presence: true
    validates :price_per_month, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
    validates :description, presence: true
    has_many :features, class_name: 'BxBlockCustomUserSubs::Feature'
    accepts_nested_attributes_for :features, allow_destroy: true 

    enum language: %i[English German Spanish French Portuguese Brazilian_Portuguese]
    enum study_format: %i[1-on-1 Group]
    enum language_type: %i[Everyday Business]

  end
end
