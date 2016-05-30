class Result < ActiveRecord::Base

  # For wrestlers
  attr_accessor :striking, :slams, :submission, :sell_timing, :matt_and_chain, :bumping
  attr_accessor :setting_up, :transition

  attr_accessor :technical, :power, :high_fly, :durability, :conditioning, :basing, :reaction_time

  attr_accessor :shine, :heel_heat, :comebacks, :facials_and_selling, :ring_awareness

  # All results in results helper
  include ResultsHelper
end
