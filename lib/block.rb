require 'time'
require 'date'
require_relative 'reservation'


class Block < Reservation
  attr_reader :rooms, :start_date, :end_date
  COST = 100

  def initialize(rooms, block_id, start_date, end_date)
    @room = room
    @block_id = block_id
    @start_date = start_date
    @end_date = end_date
  end

  def overlap?(start_date, end_date)
    super(start_date, end_date)
  end

  def length_of_stay
    super
  end

  def cost
    cost = COST * length_of_stay
  end

end
