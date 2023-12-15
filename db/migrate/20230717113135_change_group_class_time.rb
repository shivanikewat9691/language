class ChangeGroupClassTime < ActiveRecord::Migration[6.0]
  	def up
    	remove_column :language_classes, :class_time
    	add_column :language_classes, :class_time, :datetime
  	end

  	def down
    	remove_column :language_classes, :class_time
    	add_column :language_classes, :class_time, :time
  	end
end
