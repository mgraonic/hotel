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

  describe "overlap? method" do
    it "returns true if desired dates overlap with reserved dates" do
      existing_start_date = Date.parse("2018-1-1")
      existing_end_date = Date.parse("2018-1-10")

      start_date1 = Date.parse("2018-1-1")
      end_date1 = Date.parse("2018-1-10")

      start_date2 = Date.parse("2018-1-5")
      end_date2 = Date.parse("2018-1-15")

      start_date3 = Date.parse("2017-12-25")
      end_date3 = Date.parse("2018-1-5")

      start_date4 = Date.parse("2018-1-5")
      end_date4 = Date.parse("2018-1-10")

      start_date5 = Date.parse("2018-1-1")
      end_date5 = Date.parse("2018-1-5")

      start_date6 = Date.parse("2018-1-2")
      end_date6 = Date.parse("2018-1-8")

      start_date7 = Date.parse("2017-12-25")
      end_date7 = Date.parse("2018-1-15")

      reservation = Reservation.new(1, existing_start_date, existing_end_date)

      reservation.overlap?(start_date1, end_date1).must_equal true
      reservation.overlap?(start_date2, end_date2).must_equal true
      reservation.overlap?(start_date3, end_date3).must_equal true
      reservation.overlap?(start_date4, end_date4).must_equal true
      reservation.overlap?(start_date5, end_date5).must_equal true
      reservation.overlap?(start_date6, end_date6).must_equal true
      reservation.overlap?(start_date7, end_date7).must_equal true

    end
  end

  describe "check_date method" do
    it "raises an argument error for invalid dates" do
      end_date = "2018-3-6"
      start_date = "2018-3-10"
      start_date_2 = "2018-3-6"

      end_before_start = Reservation.new(5, start_date, end_date)
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

    it "does not charge for last day" do
      start_date = Date.parse("2018-3-6")
      end_date = Date.parse("2018-3-7")
      reservation = Reservation.new(5, start_date, end_date)
      reservation.cost.must_equal 200
    end
  end
end
