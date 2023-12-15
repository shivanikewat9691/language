module AccountBlock
	class GroupClassesCreator
		def create_classes(course_params, course_id, course_time, teacher)
			course_duration_minutes = course_params[:course_duration].to_i * 60
			class_duration = 90

			classes_count = course_duration_minutes / class_duration

			class_params = {
				language_course_id: course_id,
				language: course_params[:language],
				study_format: course_params[:language_course_study_format],
				class_level: course_params[:language_level],
				class_type: course_params[:language_course_class_frequency],
				class_description: course_params[:language_course_description]
			}

			course_start_date = Date.parse(course_params[:language_course_class_time])
			course_end_date = (course_start_date + classes_count.weeks).end_of_week

			i = 1
			
			schedule = parse_schedule(course_time)
			#time_zone = teacher.time_zone
			#zone_offset = ActiveSupport::TimeZone[time_zone].formatted_offset

			(course_start_date..course_end_date).each do |date|
				schedule.each do |day|
					if check_date(date, day) && classes_count > 0
						date_time = DateTime.parse("#{date.strftime("%Y-%m-%d")} #{day[:time]}")
		  				class_date_params = {
		  					class_date: date,
		  					class_time: date_time.utc,
		  					class_title: "Class #{i}: #{course_params[:language_course_title]}"
		  				}

		  				if class_overlapse?(teacher, date_time)
		  					AccountBlock::LanguageCourse.find_by(id: course_id).destroy
		  					raise StandardError.new
		  				else
		  					group_class = BxBlockClasses::LanguageClass.new(class_params.merge(class_date_params))
		  					group_class.save

		  					classes_count -= 1
		  					i += 1
		  				end
	  				end
				end
			end
		end

		private

		def parse_schedule(time)
			schedule = []

			time.each do |t|
				t['occurs_on'].each do |day|
					schedule.push({ weekday: day, time: t['start_time'] })
				end
			end

			schedule
		end

		def check_date(date, day)
			date.strftime("%a") == day[:weekday]
		end

		def datetime_ranges_overlap?(start1, end1, start2, end2)
		  start1 <= end2 && end1 >= start2
		end

		def class_overlapse?(teacher, class_time)
			overlap = false
			group_classes = teacher.language_classes.where(class_date: class_time.to_date)
			
			if group_classes.count > 0
				new_class_start = class_time.utc
				new_class_end = new_class_start + 90.minutes

				group_classes.each do |gc|
					if datetime_ranges_overlap?(gc.class_time, gc.class_end_time, new_class_start, new_class_end)
						overlap = true
						break
					end
				end
			end
			overlap
		end
	end
end