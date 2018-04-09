require 'time'
require 'date'


class Reservation
  attr_reader :room, :start_date, :end_date
  COST = 200

  def initialize(args)
    @room = args[:room]
    @start_date = args[:start_date]
    @end_date = args[:end_date]
  end

  def overlap?(start_date, end_date)
    if (!self.start_date.nil? && !self.end_date.nil?)
      return !(end_date <= self.start_date || start_date >= self.end_date)
    end
  end

  def length_of_stay
    length_of_stay = @end_date - @start_date
    days = length_of_stay.to_i
  end

  def cost
    cost = COST * length_of_stay
  end
end
