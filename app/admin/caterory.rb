ActiveAdmin.register Category do
  permit_params :name, doctor_ids: []

  index do
    selectable_column
    id_column
    column :name

    column 'Total Doctors' do |category|
      category.doctors.count
    end

    actions
  end

  show do
    attributes_table do
      row :name
      panel 'Doctors' do
        table_for category.doctors do
          column :full_name
        end
      end
    end
  end

  form do |f|
    f.inputs 'Category Details' do
      f.input :name
      f.input :doctors, as: :check_boxes, collection: Doctor.all.map { |doctor| [ "#{doctor.full_name} (#{doctor.category&.name || 'No Category'})", doctor.id ] }, include_hidden: false, label: 'Doctors'
    end
    f.actions
  end
end