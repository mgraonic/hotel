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
      return ((self.start_date>= start_date && self.start_date <= end_date) || (self.end_date <= end_date && self.end_date > start_date)) || (self.start_date <= start_date && self.end_date >= end_date)
    end
  end

# duplicate code
  def blocked?(start_date, end_date)
    if (!self.block_start_date.nil? && !self.block_end_date.nil?)
      return ((self.block_start_date>= start_date && self.block_start_date <= end_date) || (self.block_end_date <= end_date && self.block_end_date > start_date)) || (self.block_start_date <= start_date && self.block_end_date >= end_date)
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
