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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
