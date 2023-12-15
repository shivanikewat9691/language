class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :email
      t.string :password_digest
 	  t.boolean :activated, default: false, null: false
      t.timestamps
    end
  end
end
