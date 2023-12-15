# module BxBlockClasses
require 'date'
module AccountBlock
	class Language121Class < ApplicationRecord
		self.table_name = :language121_classes

		  belongs_to :student
      belongs_to :teacher, optional: true
      before_save :set_time_zone

			validates :language, presence: true
      validates :study_format, presence: true
      validates :class_level, presence: true
      validates :class_type, presence: true
      validates :class_duration, presence: true
      # validates :class_plan, presence: true
      validates :class_date, presence: true
      validates :class_weeks, presence: true
      validates :time_zone, presence:true

      validate :class_date_cannot_be_today_or_less
      # enum study_format: %i[1-on-1]
      enum status: %i[created rejected accepted cancelled completed]

      def class_date_cannot_be_today_or_less
        if class_date.present? && class_date <= Date.today
          errors.add(:class_date, "cant be in the past")
        end
      end
      private 
      def set_time_zone
        zone_offset = ActiveSupport::TimeZone[time_zone].formatted_offset
        date_time =DateTime.parse("#{self.class_date} #{self.class_time}#{zone_offset}")
        time = date_time.utc
        self.class_time = time
      end
	end
end
