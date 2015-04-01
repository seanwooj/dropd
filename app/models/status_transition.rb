class StatusTransition < ActiveRecord::Base
  belongs_to :user
  belongs_to :transitionable, :polymorphic => true

  default_scope -> { order(:event_at => :asc) }

  def transition=(transition)
    self.status_type = transition.attribute
    self.event = transition.event
    self.from_state = transition.from
    self.to_state = transition.to
  end
end
