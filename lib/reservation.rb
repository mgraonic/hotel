require 'time'
require 'date'
require 'pry'

class Reservation
  attr_reader :room, :start_date, :end_date
  COST = 200
  def initialize(room, start_date, end_date)
    @room = room
    @start_date = start_date
    @end_date = end_date
  end

  def overlap?(start_date, end_date)
    return self.start_date <= end_date || self.end_date >= start_date
  end

  def length_of_stay 
    length_of_stay = @end_date - @start_date
    days = length_of_stay.to_i
  end

  def cost
    cost = COST * length_of_stay
  end
end
