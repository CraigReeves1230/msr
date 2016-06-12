class Wrestler < ActiveRecord::Base

  #Mix in helper
  include ResultsHelper

  # Default scope
  default_scope -> { order('name ASC')}

  # No two wrestlers should be able to have the same name
  validates(:name, presence: true, uniqueness: true)
  

  def calculate_score(execution, ability, psychology)

    # average scores together with the same principles from match star rater but slightly different
    score = (execution + (ability * 3.0) + (psychology * 3.0)) / 7.0

    # reward wrestler if all three traits are strong
    score += 0.25 if execution >= 3.25 && ability >= 3.25 && psychology >= 3.25

    # reward wrestler again if ability and execution are strong
    score += 0.25 if execution >= 3.25 && ability >= 3.25

    #reward wrestler again if psychology and execution are exceptional
    score += 0.25 if execution >= 3.50 && psychology >= 3.50

    #reward wrestler again if all three traits are exceptional. This is an exceptional worker
    score += 0.25 if execution >= 3.50 && psychology >= 3.50 && ability >= 3.50

    #return score
    score
  end
end
