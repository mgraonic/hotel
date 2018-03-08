require_relative 'spec_helper'

describe "Describe Reservation Class" do
  describe "initializer" do

    it "is an instance of Reservation" do
      start_date = Date.parse("2018-3-6")
      end_date = Date.parse("2018-3-10")

      reservation = Reservation.new(5, start_date, end_date)

      reservation.must_be_kind_of Reservation
      reservation.start_date.must_be_kind_of Date
    end
  end

  describe "check_date method" do
    it "raises an argument error for invalid dates" do
      end_date = "2018-3-6"
      start_date = "2018-3-10"
      start_date_2 = "2018-3-6"

      start_before_end = Reservation.new(5, start_date, end_date)
      start_same_as_end = Reservation.new(5, start_date_2, end_date)

      proc{ start_before_end.check_date }.must_raise StandardError
      proc{ start_same_as_end.check_date }.must_raise StandardError
    end
  end

  describe "cost method" do
    it "calculates cost for length of stay" do
      start_date = Date.parse("2018-3-6")
      end_date = Date.parse("2018-3-10")

      reservation = Reservation.new(5, start_date, end_date)

      reservation.cost.must_equal 800
    end
  end

end
