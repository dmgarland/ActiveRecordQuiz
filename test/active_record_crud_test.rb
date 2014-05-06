require 'helper'

class Umbrella < ActiveRecord::Base

  attr_accessor :colour
  attr_accessor :handle_material
  attr_accessor :price
end

class  ActiveRecordCrudTest < Test::Unit::TestCase

  context "Creating records" do
    setup do
      u = Umbrella.new
      u.colour = 'red'
      u.handle_material = 'wood'
      u.price = 59.99
      u.save!
    end

    should "have one record in the database" do
      assert_equal 1, Umbrella.count
    end
  end

end
