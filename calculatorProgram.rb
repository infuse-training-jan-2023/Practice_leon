class Calculator

    def add(operand1 , operand2)   
        return operand1+operand2      
    end


end


calObj = Calculator.new

puts "Add= "+ calObj.add(40 ,20).to_s