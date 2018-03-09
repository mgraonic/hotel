require 'time'
require 'date'
require_relative 'reservation'


class Hotel
  attr_reader :rooms, :reservations

  ROOMS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]


  def initialize
    @rooms = ROOMS
    @reservations = []
  end


  def block(rooms, start_date, end_date)
    rooms.each do
      reserve(room, start_date, end_date)
    end
  end

  def available_rooms(start_date, end_date)
    start_date, end_date = check_date(start_date, end_date)

    unavailable_rooms = []

    @rooms.each do |room|
      room_id = room
      res_with_room_id = @reservations.select {|reservation| reservation.room == room_id}

      res_with_room_id.each do |reservation|
        if reservation.overlap?(start_date, end_date)
          unavailable_rooms << reservation.room
        else
        end
      end
    end
    available_rooms = @rooms - unavailable_rooms
    # minus blocked room array?
  end

  def check_date(start_date, end_date)
    start_date = Date.parse(start_date) unless start_date.is_a?(Date)
    end_date = Date.parse(end_date) unless end_date.is_a?(Date)
    if end_date == start_date || end_date < start_date
      raise StandardError.new("End date cannot be equal to or come before the start date")
    end
    return start_date, end_date
  end


  def reserve(room, start_date, end_date)
    start_date, end_date = check_date(start_date, end_date)
    rooms = self.available_rooms(start_date, end_date)

    if rooms.include?(room)
      reservation = Reservation.new(room, start_date, end_date)
      @reservations << reservation
      return reservation
    else
      raise Exception.new("Your desired room is not available")
    end
  end

  def get_reservations(date)
    reservation_list = []
    date = Date.parse(date) unless date.is_a?(Date)
    @reservations.each do |reservation|
      if date.between?(reservation.start_date, reservation.end_date)
        reservation_list << reservation
      end
    end
    return reservation_list
  end
end
