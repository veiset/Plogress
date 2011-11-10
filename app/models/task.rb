class Task < ActiveRecord::Base
  has_many :subtasks, dependent: :destroy
  belongs_to :user
  validates_inclusion_of :proficiency, :in => 0..4

  def duration
    dur = 0.0
    subtasks.each do |subtask|
      dur += subtask.duration
    end
    return dur.round(2)
  end

  def proficiency_level
    return ["None", "Bad", "Decent", "Good", "Proficient"]
  end

  def proficiency_to_s
    return proficiency_level[proficiency]
  end
end
