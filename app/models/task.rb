class Task < ActiveRecord::Base
  has_many :subtasks, dependent: :destroy
  belongs_to :user
  validates_inclusion_of :proficiency, :in => 0..4

  def proficiency_level
    return ["None", "Bad", "Decent", "Good", "Proficient"]
  end

  def proficiency_to_s
    if(proficiency.nil?)
      return "Unspecified"
    end
    return proficiency_level[proficiency]
  end
end
