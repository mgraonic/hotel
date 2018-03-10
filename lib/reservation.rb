require 'time'
require 'date'


class Reservation
  attr_reader :room, :start_date, :end_date, :block_start_date, :block_end_date
  COST = 200

  def initialize(room, start_date: nil, end_date: nil, block_id: nil, block_start_date: nil, block_end_date: nil)
    @room = room
    @start_date = start_date
    @end_date = end_date
    @block_id = block_id
    @block_start_date = block_start_date
    @block_end_date = block_end_date
  end

  def overlap?(start_date, end_date)
    return self.start_date <= end_date || self.end_date >= start_date
  end

  def blocked?(start_date, end_date)
    return self.block_start_date <= end_date || self.block_end_date >= start_date
  end

  def length_of_stay
    length_of_stay = @end_date - @start_date
    days = length_of_stay.to_i
  end

  def cost
    cost = COST * length_of_stay
  end
end
