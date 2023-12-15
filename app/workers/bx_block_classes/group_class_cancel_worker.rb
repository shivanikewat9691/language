module BxBlockClasses
    class GroupClassCancelWorker
        include Sidekiq::Worker

        def perform
            current_time = Time.now
            language_classes = BxBlockClasses::LanguageClass.where('class_date < ?', current_time + 24.hours)

            language_classes.each do |language_class|
                language_class.update(status: :canceled) unless language_class.minimaly_booked?
            end
        end
    end
end