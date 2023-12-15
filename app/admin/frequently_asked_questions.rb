ActiveAdmin.register BxBlockLandingpage3::FrequentlyAskedQuestion, as: "Frequently Asked Questions" do
  menu false

  permit_params :title, :description

  form do |f|
    f.inputs do
      f.input :title
      f.input :description, as: :text
    end
    f.actions
  end

  index title: 'Frequently Asked Questions' do
    selectable_column
    id_column
    column :title
    column :description

    actions
  end

  show do
    attributes_table do
      row :title
      row :description
    end
  end
end
