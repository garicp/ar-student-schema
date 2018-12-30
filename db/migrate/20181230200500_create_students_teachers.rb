require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateStudentTeachers < ActiveRecord::Migration[5.0]
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :student_teachers do |t|
      # add columns that you would need for this table
      # creating foreign key in new table
      t.belongs_to :student
      t.belongs_to :teacher
      t.timestamps
    end
  end
end
