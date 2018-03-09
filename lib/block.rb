require 'time'
require 'date'
require_relative 'reservation'


class Reservation < Reservation
  attr_reader :rooms, :start_date, :end_date

def initialize(rooms, start_date, end_date)
  @room = room
  @start_date = start_date
  @end_date = end_date
end




end
