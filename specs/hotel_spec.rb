require_relative 'spec_helper'
require 'pry'

describe "Hotel class" do
  describe "Initializer" do
    it "is an instance of Hotel" do
      hotel = Hotel.new
      hotel.must_be_kind_of Hotel
    end

    it "contains an empty array of reservations" do
      hotel = Hotel.new
      hotel.reservations.must_equal []
    end

    it "access the list of all rooms in the hotel" do
      rooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
      hotel = Hotel.new
      hotel.rooms.must_equal rooms
    end
  end

  describe "check_date method" do
    it "raises an argument error for invalid dates" do
      end_date = "2018-3-6"
      start_date = "2018-3-10"
      start_date_2 = "2018-3-6"

      hotel_start_before_end = Hotel.new
      hotel_start_end_same = Hotel.new

      proc{ hotel_start_before_end.reserve(start_date, end_date) }.must_raise StandardError
      proc{ hotel_start_end_same.reserve(start_date_2, end_date) }.must_raise StandardError
    end
  end

  describe "reserve_block method" do
    # it "create a block of rooms" do
    #   start_date = "2018-1-1"
    #   end_date = "2018-1-10"
    #   rooms = [1, 2, 3, 5, 8]
    #   hotel = Hotel.new
    #
    #   hotel.reserve_block(rooms, start_date, end_date)
    #
    #   hotel.blocked_rooms.length.must_equal 5
    #   hotel.blocked_rooms.first.start_date.must_be_kind_of Date
    # end

    it "check whether block has rooms available" do

    end
    it "reserve a room from within a block of rooms" do

    end
  end



  describe "Reserve method" do
    it "can reserve a room for a given date range" do
      start_date = "2018-3-6"
      end_date = "2018-3-10"
      start_date2 = "2018-4-6"
      end_date2 = "2018-4-10"

      hotel = Hotel.new

      reservation1 = hotel.reserve(1, start_date, end_date)
      reservation2 = hotel.reserve(2, start_date2, end_date2)

      reservation1.must_be_kind_of Reservation
      hotel.reservations.length.must_equal 2
      hotel.reservations.first.must_equal reservation1
      hotel.reservations.last.must_equal reservation2
    end

    it "raises an argument error for invalid dates" do
      end_date = "2018-3-6"
      start_date = "2018-3-10"
      start_date_2 = "2018-3-6"

      hotel = Hotel.new

      proc{ hotel.reserve(start_date, end_date) }.must_raise StandardError
      proc{ hotel.reserve(start_date2, end_date) }.must_raise StandardError
    end
    it "raises an exception when asked to reserve unavailable room" do
      start_date = Date.parse("2018-1-1")
      end_date = Date.parse("2018-1-10")
      start_date2 = Date.parse("2018-1-1")
      end_date2 = Date.parse("2018-1-10")
      room = 1
      hotel = Hotel.new

      20.times do
        hotel.reserve(room, start_date, end_date)
        room += 1
      end

      proc {hotel.reserve(1, start_date2, end_date2)}.must_raise Exception
    end
  end

  describe "Available_rooms method" do
    it "returns an array of available rooms for given date range" do
      start_date = "2018-3-6"
      end_date = "2018-3-10"
      start_date2 = "2018-3-9"
      end_date2 = "2018-3-29"
      hotel = Hotel.new
      reservation1 = hotel.reserve(1, start_date, end_date)
      reservation2 = hotel.reserve(2, start_date2, end_date2)

      rooms = hotel.available_rooms(start_date, end_date)

      rooms.must_be_kind_of Array
      rooms.sample.must_be_kind_of Integer
      rooms.length.must_equal 18
    end

    it "returns an empty array if all rooms are booked" do
      start_date = Date.parse("2018-1-1")
      end_date = Date.parse("2018-1-10")
      start_date2 = Date.parse("2018-1-1")
      end_date2 = Date.parse("2018-1-10")
      room = 1
      hotel = Hotel.new

      20.times do
        hotel.reserve(room, start_date, end_date)
        room += 1
      end

      hotel.available_rooms(start_date2, end_date2).must_equal []
    end

    it "raises a StandardError for invalid dates" do
      end_date = "2018-3-6"
      start_date = "2018-3-10"
      start_date_2 = "2018-3-6"

      hotel = Hotel.new

      proc{ hotel.available_rooms(start_date, end_date) }.must_raise StandardError
      proc{ hotel.available_rooms(start_date2, end_date) }.must_raise StandardError
    end
  end


  describe "Get_reservations method" do
    it "provides a list of reservations for a given date" do
      start_date = "2018-3-6"
      end_date = "2018-3-10"
      start_date2 = "2018-3-6"
      end_date2 = "2018-3-29"
      start_date3 = "2018-4-7"
      end_date3 = "2018-4-9"
      date = "2018-3-8"

      hotel = Hotel.new

      reservation1 = hotel.reserve(15, start_date, end_date)
      reservation2 = hotel.reserve(16, start_date2, end_date2)
      reservation3 = hotel.reserve(1, start_date3, end_date3)

      list = hotel.get_reservations(date)

      list.must_be_kind_of Array
      list.length.must_equal 2
      list.first.must_equal reservation1
      list.last.must_equal reservation2
      list.include?(reservation3).must_equal false
    end
    it "text" do

    end
  end

end
