require 'helper'

class Umbrella < ActiveRecord::Base

end

class  ActiveRecordCrudTest < Test::Unit::TestCase

  context "Creating records" do
    setup do
      @u = Umbrella.new
      @u.colour = 'red'
      @u.handle_material = 'wood'
      @u.price = 59.99
      @u.save!
    end

    should "have one record in the database" do
      assert_equal 1, Umbrella.count
    end
  end

  context "Reading records" do
    setup do
      @u = Umbrella.new
      @u.colour = 'red'
      @u.handle_material = 'wood'
      @u.price = 59.99
      @u.save!
    end

    should "allow us to find a record" do
      assert_equal @u, Umbrella.find_by_colour("red")
      assert_equal [@u], Umbrella.where(:handle_material => 'wood')
      assert_equal [@u], Umbrella.where(:price => 59.99)

    end

  end
  
  context "Update records" do
    setup do
      @u = Umbrella.new
      @u.colour = 'red'
      @u.handle_material = 'wood'
      @u.price = 59.99
      @u.save!
    end

    should "allow us to update a record" do
      @u.update_attributes({ :colour => "Green"})
      @u.reload
      assert_equal 'Green', @u.colour
    end

  end

  context "Delete records" do
    setup do
      @u = Umbrella.new
      @u.colour = 'red'
      @u.handle_material = 'wood'
      @u.price = 59.99
      @u.save!
    end

    should "delete the record with destroy" do
      @u.destroy
      assert_equal 0, Umbrella.count
    end

  end

end
