require_relative 'reservation'


  class Hotel

    attr_reader :rooms, :reservations

    # :rooms returns a list of all rooms

    ROOMS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]


    def initialize
      @rooms = ROOMS
      @reservations = []
    end

    def available_rooms(date_range) # all unreserved

      # iterates over rooms array
      # for each room:
      # checks if a reservation exists with that room number
      # returns list of available rooms
    end

    def check_date(date_range)
      # validates the date range
      # if date_range is invalid, raises a StandardError
    end

    def reserve(start_date, end_date)
      room = ROOMS.sample
      reservation = Reservation.new(room, start_date, end_date)
      # calls check_date method to validate dates

      # calls available_rooms method
      # if list of available rooms is empty?
      # **raises an exception**
      # ELSE:
      # uses first available room in array to
      # create instance of Reservation
      # reservations << Reservation instance
    end

    def get_reservations(date)
      # checks each reservation in the reservations array
      # returns list of reservations which
      # contain the date it's date range
    end

  end
