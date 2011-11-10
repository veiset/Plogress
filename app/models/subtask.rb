class Subtask < ActiveRecord::Base
  belongs_to :task
  has_many :sessions, dependent: :destroy
  validates_inclusion_of :difficulty, :in => 0..5

  def level_strings
    return ["Unspecified", "Very easy", "Easy", "Medium", "Hard", "Very hard"]
  end

  def level_to_s
    return level_strings[level]
  end

  def duration
    dur = 0.0
    sessions.each do |session|
      dur += session.duration
    end
    return dur
  end
end
