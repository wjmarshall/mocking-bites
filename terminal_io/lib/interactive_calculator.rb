class InteractiveCalculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello, I will subract two numers."
    @io.puts "Please enter a number"
    num1 = @io.gets.chomp
    @io.puts "Please enter another number"
    num2 = @io.gets.chomp
    @io.puts "Here is your result"
    result = num1.to_i - num2.to_i
    @io.puts "#{num1} - #{num2} = #{result}"
  end 
end

# interactive_calculator = InteractiveCalculator.new(Kernel)
# interactive_calculator.run