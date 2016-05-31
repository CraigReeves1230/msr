class CreateWrestlers < ActiveRecord::Migration
  def change
    create_table :wrestlers do |t|
      t.float :execution
      t.float :slams
      t.float :submission
      t.float :sell_timing
      t.float :setting_up
      t.float :transition
      t.float :mat_and_chain
      t.float :bumping
      t.float :technical
      t.float :power
      t.float :high_fly
      t.float :durability
      t.float :conditioning
      t.float :basing
      t.float :basing
      t.float :reaction_time
      t.float :ability
      t.float :shine
      t.float :heat
      t.float :comebacks
      t.float :selling
      t.float :ring_awareness
      t.float :psychology

      t.timestamps null: false
    end
  end
end
