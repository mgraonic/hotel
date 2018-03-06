
  class Reservation
    attr_reader :room, :start_date, :end_date
    COST = 200

    def initialize(room, start_date, end_date)
      @room = room
      @start_date = start_date
      @end_date = end_date
    end


    def cost(id)
      # takes in room id
      # computes number of nights
      # based on date range (-1 for checkout day)
      # computes rate * nights
      # returns cost as integer
    end

  end
