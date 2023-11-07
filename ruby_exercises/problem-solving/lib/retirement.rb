class Retirement
  def calculate(num1, num2)
    if num1.negative?
      "Error. Age cannot be negative."
    elsif num2.negative?
      "Error. Retirement age cannot be negative."
    else
      amount = num2 - num1
      "You have #{amount} years left until you can retire. It is 2015, so you can retire in #{2015 + amount}."
    end
  end
end