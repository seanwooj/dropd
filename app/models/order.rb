# == Schema Information
#
# Table name: orders
#
#  id                        :integer          not null, primary key
#  note                      :text
#  order_contents            :text
#  order_number              :string
#  customer_email            :string
#  customer_phone            :string
#  customer_delivery_address :string
#  customer_delivery_city    :string
#  customer_delivery_state   :string
#  customer_delivery_zipcode :integer
#  contacted                 :boolean          default(FALSE)
#  user_id                   :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  customer_name             :string
#  status                    :string           default("open")
#

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :status_transitions, :as => :transitionable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :order_contents, :presence => true
  validates :order_number, :presence => true
  validates :customer_name, :presence => true
  validates :customer_email, :presence => true, :format => {:with => VALID_EMAIL_REGEX}
  validates :customer_phone, :presence => true
  validates :customer_delivery_address, :presence => true
  validates :customer_delivery_city, :presence => true
  validates :customer_delivery_state, :presence => true
  validates :customer_delivery_zipcode, :presence => true
  validates :user_id, :presence => true

  state_machine :status, :initial => :open do
    around_transition do |order, transition, block|
      order.status_transitions.create!({:transition => transition})
      block.call
    end

    event :contact_customer do
      transition :open => :contacted_customer
    end

    event :begin_delivery do
      transition :contacted_customer => :out_for_delivery
    end

    event :deliver do
      transition [:out_for_delivery, :open, :contacted_customer] => :delivered
    end

    event :cancel do
      transition all => :cancelled
    end
  end
end
