require 'time'
require 'date'
require_relative 'reservation'


class Block < Reservation
  attr_reader :block_id, :rooms, :start_date, :end_date
  COST = 100

  def initialize(block_id, rooms, start_date, end_date)
    super(start_date, end_date)
    @block_id = block_id
    @rooms = rooms
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
