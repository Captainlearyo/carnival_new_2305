class Carnival
 attr_reader :duration, :rides
 #attr__accessor :
    def initialize(duration)
      @duration = duration
      @rides = []
    end  

    def add_ride(ride_hash)
      @rides << ride_hash
    end

  

    def most_popular_ride
      most = 0
      ride = nil
        @rides.each do  |i| 
           if i.rider_log.count > most
              most = i.rider_log.count
               ride = i
            end
        end
        ride
    end

    def most_profitable_ride
      most = 0
      ride = nil
        @rides.each do  |i| 
           if i.total_revenue > most
              most = i.total_revenue
               ride = i
            end
        end
        ride
    end

    def total_revenue
      sum = 0
        @rides.each do  |i| 
        sum += i.total_revenue
    end
    sum
  end


  def summery 
    hash = {}
    hash[:revenue_earned] = total_revenue
    hash[:visitor_count] = @rides.reduce(0){ |sum, i| sum + i.rider_log.count}
    hash[:visitors] = []
    @rides.each{ |ride| ride.rider_log.each{ |visitor| hash[:visitors] << visitor } }
    hash[:rides] = @rides

     hash
  end

end