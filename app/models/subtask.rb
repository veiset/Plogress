class Subtask < ActiveRecord::Base
  belongs_to :task
  has_many :sessions, dependent: :destroy
  validates_inclusion_of :proficiency, :in => 0..4

  def proficiency_level
    return ["None", "Bad", "Decent", "Good", "Proficient"]
  end

  def proficiency_to_s
    return proficiency_level[proficiency]
  end

  def duration
    dur = 0.0
    sessions.each do |session|
      dur += session.duration
    end
    return dur
  end

    def proficiency_level
    return ["None", "Bad", "Decent", "Good", "Proficient"]
  end

  def proficiency_to_s
    return proficiency_level[proficiency]
  end

end
