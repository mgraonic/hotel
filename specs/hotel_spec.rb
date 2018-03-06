require_relative 'spec_helper'

describe "Hotel class" do
  describe "Initializer" do
    it "is an instance of Hotel" do
      hotel = Hotel.new
      hotel.must_be_kind_of Hotel
    end

    it "contains an array of room numbers" do
      hotel = Hotel.new
      hotel.rooms.must_be_kind_of Array
      hotel.rooms.first.must_be_kind_of Integer
    end

    it "contains an empty array reservations" do
      hotel = Hotel.new
      hotel.reservations.must_equal []
    end


  end

  describe "Reserve method" do

  end

  describe "Available_rooms method" do

  end


  describe "Get_reservations method" do

  end

end
