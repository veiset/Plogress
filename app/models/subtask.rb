class Subtask < ActiveRecord::Base
	belongs_to :task
	has_many :sessions, dependent: :destroy
	validates_inclusion_of :difficulty, :in => 0..5
end
