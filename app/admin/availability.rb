ActiveAdmin.register BxBlockAppointmentManagement::Availability do

   menu label: "Teacher Availability"

   permit_params :start_time, :end_time, :availability_date


   index  title: 'Teacher Availability' do
    selectable_column
    id_column
    column :start_time
    column :end_time
    column :availability_date
    
   actions 
  end

# show do
#     attributes_table do
#       row :start_time
#       row :end_time
#       row :availability_date
      
#     end
#   end

end