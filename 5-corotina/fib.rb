#!/usr/bin/env ruby1.9

class IFib
  def fib(max)
    x,y,i = 0,1,0
    while(i < max)
      yield y
      x,y,i = y,x+y,i+1
    end
  end  
end

class EFib
  def initialize
    @fib = Fiber.new do
      x,y = 0,1
      loop do
        Fiber.yield y
        x,y = y,x+y
      end
    end
  end
  
  def fib
    @fib.resume
  end
end

def fib(max)
  x,y,i = 0,1,0
  while(i < max)
    yield y
    x,y,i = y,x+y,i+1
  end
end  
