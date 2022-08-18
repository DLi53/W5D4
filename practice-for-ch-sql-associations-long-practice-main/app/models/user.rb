# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

    has_many :enrollments,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :Enrollment

    has_many :enrolled_courses,
        through: :enrollments, # goes through own enrollments, not the table
        source: :course # takes from the student through our own enrollments

    has_one :course,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :Course
end
