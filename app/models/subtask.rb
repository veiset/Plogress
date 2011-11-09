class Subtask < ActiveRecord::Base
	belongs_to :task
	has_many :sessions, dependent: :destroy
end
