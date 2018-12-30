require 'date'

class Student < ActiveRecord::Base
# implement your Student model here

	validates :email, uniqueness: true
	validates :email, format: { with: /.+@.+\...+/ } 
	validates :age, numericality: { greater_than: 5 }
	validates :phone, format: {with: /\d/}, length: {minimum: 10}, on: :create

	has_many :student_teachers
	has_many :teachers, through: :student_teachers
	
	def name
		return "#{self.first_name} #{self.last_name}"
		# self means refer to individual in Student.new
	end

	# def self.dummy
	# 	p self
	# end

	def age
		"#Age------"
		age = Date.today.year - self.birthday.year
	end

end