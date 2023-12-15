namespace :export do
    desc "Export all timezones to JSON file with zone offset"
    task :timezones => :environment do
      require 'json'
  
      # Load all timezones using the tzinfo gem
      timezones = ActiveSupport::TimeZone.all.map do |timezone|
        offset = ActiveSupport::TimeZone[timezone.name].formatted_offset
        label = "(GMT#{offset}) #{timezone.name}"

        {
          label: label,
          offset: offset,
          value: timezone.name
        }
      end
  
      # Write the timezones to a JSON file
      json_data = JSON.pretty_generate(timezones)
      File.write('timezones.json', json_data)
  
      puts "All timezones exported to 'timezones.json'"
    end
  end