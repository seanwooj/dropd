class Order < ActiveRecord::Base
  belongs_to :user
  has_many :status_transitions, :as => :transitionable
end
