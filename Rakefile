require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'lib/students_importer'
require_relative 'app/models/teacher'

desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
  touch 'db/ar-students_test.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
  rm_f 'db/ar-students_test.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  Dir[File.join('db', '*.sqlite3')].each do |db_path|
    ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/#{db_path}")
    ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::MigrationContext.new(ActiveRecord::Migrator.migrations_paths).migrate do |migration|
      ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
    end
  end
end

desc "populate the students database with sample data"
task "db:populate" do
  StudentsImporter.import
end

desc "populate the teachers database with sample data"
task "db:populate_teacher" do
  # Create some teachers for your teachers table in database
  Teacher.create(name:'teacher1', email:'teacher1@mail.com', phone:'0123456781')
  Teacher.create(name:'teacher2', email:'teacher2@mail.com', phone:'0123456782')
  Teacher.create(name:'teacher3', email:'teacher3@mail.com', phone:'0123456783')
  Teacher.create(name:'teacher4', email:'teacher4@mail.com', phone:'0123456784')
  Teacher.create(name:'teacher5', email:'teacher5@mail.com', phone:'0123456785')
  Teacher.create(name:'teacher6', email:'teacher6@mail.com', phone:'0123456786')
  Teacher.create(name:'teacher7', email:'teacher7@mail.com', phone:'0123456787')
  Teacher.create(name:'teacher8', email:'teacher8@mail.com', phone:'0123456788')
  Teacher.create(name:'teacher9', email:'teacher9@mail.com', phone:'0123456789')

  # p 'populate_teacher executed :)'
end

desc "populate the student_teachers"
task "db:populate_mix" do
  
  students = Student.all
  teachers = Teacher.all

  students.each do |student|
  teacher_id = []

    teachers.each do |teacher|
      teacher_id << teacher.id
    end

    3.times{
      x = teacher_id.sample
      StudentTeacher.create(student_id:student.id, teacher_id:x)
      teacher_id.delete(x)
    }
  end
  # p 'populate_mix executed :):)'
end


desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs
