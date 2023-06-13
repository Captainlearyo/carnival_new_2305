require "spec_helper.rb"

RSpec.describe Carnival do

  describe "Carnival" do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor1.add_preference(:gentle)

    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:thrilling)

    visitor3 = Visitor.new('Penny', 64, '$15')
    visitor3.add_preference(:thrilling)

    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)

    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })

    ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    ride3.board_rider(visitor3)

    carnival = Carnival.new(14)
    carnival.add_ride(ride1)
    carnival.add_ride(ride2)
    carnival.add_ride(ride3)

    it "exists" do
      expect(carnival).to be_a  Carnival
      expect(carnival.duration).to eq(14)
      expect(carnival.rides).to eq([ride1, ride2, ride3])
    end

    it "add_ride" do
      expect(carnival.rides).to eq([ride1, ride2, ride3])
    end

    it "most_profitable_ride" do
      expect(carnival.most_profitable_ride).to eq(ride1)
    end

    it "most_popular_ride" do
      expect(carnival.most_popular_ride).to eq(ride1)
     
    end

    it "total_revenue" do
      expect(carnival.total_revenue).to eq(5)
    end

    it "summery" do
      expect(carnival.summery).to eq(1)
    end

    
  end

  

end