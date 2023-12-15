module BxBlockClasses
	class LanguageClass < ApplicationRecord
  	self.table_name = :language_classes
  	
      belongs_to :language_course, class_name:"AccountBlock::LanguageCourse", optional: true
      has_and_belongs_to_many :students, class_name: 'AccountBlock::Student'
      before_save :set_status
      before_save :set_occurence_day, if: :saved_change_to_class_time?
      after_save :send_cancel_notification, if: :saved_change_to_status?


      validates :language, presence: true
      validates :study_format, presence: true
      validates :class_level, presence: true
      validates :class_type, presence: true
      #validates :class_plan, presence: true
      validates :class_date, presence: true
      validates :class_time, presence: true
      

      validate :class_date_cannot_be_today_or_less, on: :create
      validate :class_capacity_check, on: :update
      enum status: %i[created canceled completed] 
      scope :by_language, ->(param) { where(language: param) if param.present? }
      scope :by_level, ->(param) { where(class_level: param) if param.present? }
      scope :by_study_format, ->(param) { where('study_format ILIKE ?', "%#{param}%") if param.present? }
      scope :by_date, ->(param) { where(class_date: Date.parse(param)) if param.present? }
      scope :upcoming, ->() { where("class_date > ?", Date.today)}
      scope :not_booked_by_student, ->(student_id) do
        joins("LEFT JOIN language_classes_students ON language_classes.id = language_classes_students.language_class_id")
          .where("language_classes_students.student_id IS NULL OR language_classes_students.student_id != ?", student_id)
      end
      scope :by_occurence_day, ->(days) { where(occurs_on: days.split(",")) if days.present? }

      def class_date_cannot_be_today_or_less
        if class_date.present? && class_date <= Date.today
          errors.add(:class_date, "cant be in the past")
        end
      end

      def fully_booked?
        student_ids.size > students_max.to_i
      end

      def class_capacity_check
        if fully_booked?
          students.delete(students.last)
          errors.add(:student_ids, "no free places left")
        end
      end

      def class_end_time
        class_time + 90.minutes
      end

      def set_status
        self.status = "created" unless status.present?
      end

      def send_cancel_notification
        if canceled? && students.count > 0
          students.each do |student|
            BxBlockNotifications::StudentGroupClassCancelMailer.student_canceled_class(student,class_date,class_time,class_title).deliver_now
          end
        end
      end

      def teacher
        teacher = language_course.teacher
        teacher.present? ? teacher : nil
      end

      def set_occurence_day
        self.occurs_on = self.class_time.strftime("%a")
      end

      def minimaly_booked?
        students.count >= students_min
      end
	end
end
