require 'time'
require 'date'
require_relative 'reservation'
require 'pry'

class Hotel
  attr_reader :rooms, :reservations

  ROOMS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]


  def initialize
    @rooms = ROOMS
    @reservations = []
  end

  # def reservation_exists?(room)
  #   @reservations.
  #
  # end

  def available_rooms(start_date, end_date) # all unreserved rooms
    # iterates over rooms array
    available_rooms = []
    puts "line 25"
    @rooms.each do |room|
      # refactor to use map method
      puts "line 28"
      @reservations.each do |reservation|
        puts "line30"
        if reservation.free?(start_date, end_date)
          puts "executed line 29 - yes overlap"
        else
          available_rooms << reservation.room
          puts "executed line 35 - no overlap"
        end
      end

    end
    return available_rooms
    # for each room:
    # checks if a reservation exists with that room number
    # returns list of available rooms
  end

  def check_date(start_date, end_date)
    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)
    if end_date == start_date || end_date < start_date
      raise StandardError.new("End date cannot be equal to or come before the start date")
    end
  end

  def reserve(start_date, end_date)
    # parses dates into Time objects and checks validity
    check_date(start_date, end_date)
    room = ROOMS.sample
    reservation = Reservation.new(room, start_date, end_date)
    @reservations << reservation


    return reservation
    # calls available_rooms method
    # if list of available rooms is empty?
    # **raises an exception**
    # ELSE:
    # uses first available room in array to
    # create instance of Reservation
    # reservations << Reservation instance
  end

  def get_reservations(date)
    reservation_list = []
    date = Date.parse(date)
    @reservations.each do |reservation|
      if date.between?(reservation.start_date, reservation.end_date)
        reservation_list << reservation
      end
    end
    return reservation_list
  end

end
