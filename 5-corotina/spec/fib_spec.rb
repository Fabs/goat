require 'spec'
require 'fib'

describe "fibonnaci" do
  
  it "should yield correct sequence with the internal iterator" do 
    ifib = IFib.new
    @seq = []
    ifib.fib(10) do |x|
      @seq << x
    end
    @seq.should == [1,1,2,3,5,8,13,21,34,55]
  end
  
  it "should yield correct sequence with external iterators" do
    efib = EFib.new
    @seq = []
    10.times {
      @seq << efib.fib
    }
    @seq.should == [1,1,2,3,5,8,13,21,34,55]
  end
  
  
  
end