class Ride
 attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log, :total_revenue
 #attr__accessor :
    def initialize(ride_info)
    @name = ride_info[:name]
    @min_height = ride_info[:min_height]
    @admission_fee = ride_info[:admission_fee]
    @excitement = ride_info[:excitement]  
    @rider_log = {} 
    @total_revenue = 0
    end  


    def board_rider(visitor)
      if !visitor.preferences.include?(@excitement)
        "does not have preference"
      elsif visitor.height < @min_height
        "not tall enough"
      else
        @total_revenue += @admission_fee
        visitor.spending_money -= @admission_fee 
        if @rider_log.include?(visitor)
        @rider_log[visitor] += 1
        else 
          @rider_log[visitor] = 1
        end
      end
    end
end