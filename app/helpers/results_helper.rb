module ResultsHelper

  def calculate(execution, heat, action, layout, selling, factoring_heat)

    # Force type to be float
    execution = execution.to_f
    heat = heat.to_f
    action = action.to_f
    selling = selling.to_f
    layout = layout.to_f


    # Factoring heat
    self.factoring_heat = factoring_heat

    # Calculate match score and return the star rating
    self.score = calculate_score(execution, heat, action, layout, selling, factoring_heat)
    convert_to_star_rating(self.score)
  end

  def calculate_score(execution, heat, action, layout, selling, factoring_heat)

    # Force type to be float
    execution = execution.to_f
    heat = heat.to_f
    action = action.to_f
    selling = selling.to_f
    layout = layout.to_f

    # Determine story score
    story = (layout + selling) / 2.0

    if factoring_heat
      score = (execution + (heat * 2.0) + action + (story * 3.0))/7.0
      score = filter_score(execution, heat, action, story, score)
      score
    else
      score = (execution + action + (story * 3.0))/5.0;
      score = filter_score(execution, heat, action, story, score)
      score
    end
  end

  def filter_score(execution, heat, action, story, score)

    # If the execution is poor, punish performers harshly
    if execution < 2.0
      score -= 1.5
    end
    # If execution is exemplary, reward performers greatly but only if match is strong
    if execution >= 4.5 && score >= 3.5
      score += 0.25
    end
    # If execution is great, reward performers greatly but only in good action
    if execution >= 4.0 && action >= 3.0
      score += 0.25
    end
    # If the crowd is hot for the match and the story is good, reward match but only
    # if action too is strong
    if factoring_heat
      if heat > 3.0 && story >= 3.0 && action >= 3.0
        score += 0.25
      end
    end
    # If the action is better than average and the execution is not, this tells
    # us that it was probably sloppy
    if execution <= 2.0 && action > 2.25
      score -= 0.25
    end
    # If the execution is very good and the action is too, reward performers
    if execution > 3.25 && action > 3.25
      score += 0.25
    end
    # If the heat is incredible and the match is great, reward match generously
    if factoring_heat
      if heat > 4.0 && story >= 4.0 && story >= 3.0
        score += 0.50
      end
    end
    #return score
    score
  end

  def convert_to_star_rating(score)
    if score < 0.25
      value = "DUD"
    end
    if score >= 0.25 && score < 0.5
      value = "1/4*"
    end
    if score >= 0.50 && score < 0.75
      value = "1/2*"
    end
    if score >= 0.75 && score < 1.0
      value = "3/4*"
    end
    if score >= 1.0 && score < 1.25
      value = "*"
    end
    if score >= 1.25 && score < 1.50
      value = "*1/4"
    end
    if score >= 1.50 && score < 1.75
      value = "*1/2"
    end
    if score >= 1.75 && score < 2.0
      value = "*3/4"
    end
    if score >= 2.0 && score < 2.25
      value = "**"
    end
    if score >= 2.25 && score < 2.5
      value = "**1/4"
    end
    if score >= 2.50 && score < 2.75
      value = "**1/2"
    end
    if score >= 2.75 && score < 3.0
      value = "**3/4"
    end
    if score >= 3.0 && score < 3.25
      value = "***"
    end
    if score >= 3.25 && score < 3.5
      value = "***1/4"
    end
    if score >= 3.5 && score < 3.75
      value = "***1/2"
    end
    if score >= 3.75 && score < 4.0
      value = "***3/4"
    end
    if score >= 4.0 && score < 4.25
      value = "****"
    end
    if score >= 4.25 && score < 4.5
      value = "****1/4"
    end
    if score >= 4.5 && score < 4.75
      value = "****1/2"
    end
    if score >= 4.75 && score < 4.90
      value = "****3/4"
    end
    if score >= 4.9
      value = "*****"
    end
    #return value
    value
  end

end
