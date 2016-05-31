class Wrestler < ActiveRecord::Base

  #Mix in helper
  include ResultsHelper

  def calculate_score(execution, ability, psychology)

    # average scores together with the same principles from match star rater but slightly different
    score = (execution + (ability * 3.0) + (psychology * 3.0)) / 7.0

    # reward wrestler if execution and ability is strong
    score += 0.25 if execution && ability >= 3.5

    # if the wrestler's execution is exemplary, reward wrestler only if other traits are strong.
    score += 0.25 if execution > 3.5 && psychology >= 3.25 && ability >= 3.25

    #return score
    score
  end
end
