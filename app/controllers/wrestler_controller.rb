class WrestlerController < ApplicationController

  include WrestlerHelper

  def new
    @wrestler = Wrestler.new
  end

  def show
    @wrestler = Wrestler.new

    # assign params to instance
    @wrestler.name = params[:wrestler][:name]
    @wrestler.striking = params[:wrestler][:striking]
    @wrestler.slams = params[:wrestler][:slams]
    @wrestler.submission = params[:wrestler][:submission]
    @wrestler.sell_timing = params[:wrestler][:sell_timing]
    @wrestler.mat_and_chain = params[:wrestler][:mat_and_chain]
    @wrestler.transition = params[:wrestler][:transition]
    @wrestler.setting_up = params[:wrestler][:setting_up]
    @wrestler.bumping = params[:wrestler][:bumping]

    @wrestler.technical = params[:wrestler][:technical]
    @wrestler.high_fly = params[:wrestler][:high_fly]
    @wrestler.power = params[:wrestler][:power]
    @wrestler.conditioning = params[:wrestler][:conditioning]
    @wrestler.durability = params[:wrestler][:durability]
    @wrestler.basing = params[:wrestler][:basing]
    @wrestler.reaction_time = params[:wrestler][:reaction_time]

    @wrestler.shine = params[:wrestler][:shine]
    @wrestler.heat = params[:wrestler][:heat]
    @wrestler.ring_awareness = params[:wrestler][:ring_awareness]
    @wrestler.selling = params[:wrestler][:selling]
    @wrestler.comebacks = params[:wrestler][:comebacks]

    @wrestler.execution = execution_score
    @wrestler.ability = ability_score
    @wrestler.psychology = psych_score

    # calculate wrestler score
    @wrestler.score = @wrestler.calculate_score(execution_score, ability_score, psych_score)

    #store star rating
    @wrestler.star_rating = @wrestler.convert_to_star_rating(@wrestler.score)

    # send to results page
    render 'wrestler/wrestler_score'

  end

  def execution_score
    striking = @wrestler.striking.to_f
    slams = @wrestler.slams.to_f
    submission = @wrestler.submission.to_f
    sell_timing = @wrestler.sell_timing.to_f
    mat_and_chain = @wrestler.mat_and_chain.to_f
    transition = @wrestler.transition.to_f
    setting_up = @wrestler.setting_up.to_f
    bumping = @wrestler.bumping.to_f
    (striking + slams + submission + sell_timing + mat_and_chain + transition + setting_up + bumping) / 8.0
  end

  def ability_score
    technical = @wrestler.technical.to_f
    high_fly = @wrestler.high_fly.to_f
    power = @wrestler.power.to_f
    conditioning = @wrestler.conditioning.to_f
    durability = @wrestler.durability.to_f
    basing = @wrestler.basing.to_f
    reaction_time = @wrestler.reaction_time.to_f
    (technical + high_fly + power + conditioning + durability + basing + reaction_time) / 7.0
  end

  def psych_score
    shine = @wrestler.shine.to_f
    heat = @wrestler.heat.to_f
    selling = @wrestler.selling.to_f
    comebacks = @wrestler.comebacks.to_f
    ring_awareness = @wrestler.ring_awareness.to_f
    (shine + heat + selling + comebacks + ring_awareness) / 5.0
  end

  def save
    ActionController::Parameters.permit_all_parameters = true
    @wrestler = Wrestler.new(params[:wrestler])
    @wrestler.save
    redirect_to all_wrestlers_url
  end

  def index
    @wrestlers = Wrestler.all
  end

  def edit
    @wrestler = Wrestler.find_by( :id => params[:id])
  end

  def destroy
    Wrestler.destroy(params[:id])
    redirect_to all_wrestlers_url
  end

  def update
    ActionController::Parameters.permit_all_parameters = true
    @wrestler = Wrestler.find(params[:wrestler][:id])

    # assign params to instance
    @wrestler.name = params[:wrestler][:name]
    @wrestler.striking = params[:wrestler][:striking]
    @wrestler.slams = params[:wrestler][:slams]
    @wrestler.submission = params[:wrestler][:submission]
    @wrestler.sell_timing = params[:wrestler][:sell_timing]
    @wrestler.mat_and_chain = params[:wrestler][:mat_and_chain]
    @wrestler.transition = params[:wrestler][:transition]
    @wrestler.setting_up = params[:wrestler][:setting_up]
    @wrestler.bumping = params[:wrestler][:bumping]

    @wrestler.technical = params[:wrestler][:technical]
    @wrestler.high_fly = params[:wrestler][:high_fly]
    @wrestler.power = params[:wrestler][:power]
    @wrestler.conditioning = params[:wrestler][:conditioning]
    @wrestler.durability = params[:wrestler][:durability]
    @wrestler.basing = params[:wrestler][:basing]
    @wrestler.reaction_time = params[:wrestler][:reaction_time]

    @wrestler.shine = params[:wrestler][:shine]
    @wrestler.heat = params[:wrestler][:heat]
    @wrestler.ring_awareness = params[:wrestler][:ring_awareness]
    @wrestler.selling = params[:wrestler][:selling]
    @wrestler.comebacks = params[:wrestler][:comebacks]

    @wrestler.execution = execution_score
    @wrestler.ability = ability_score
    @wrestler.psychology = psych_score

    # calculate wrestler score
    @wrestler.score = @wrestler.calculate_score(execution_score, ability_score, psych_score)

    #store star rating
    @wrestler.star_rating = @wrestler.convert_to_star_rating(@wrestler.score)

    #save wrestler
    @wrestler.save!
    redirect_to all_wrestlers_url
  end

  private

    def wrestler_params
      params.permit(:wrestler)
    end

end


