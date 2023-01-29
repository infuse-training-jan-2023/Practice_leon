require 'test/unit'
require_relative 'exp1'
class TestExp1 < Test::Unit::TestCase
    def test_SerialNo_case_1

        serialNo = "002-10.00-20.00"
        assert_equal("002-15.00", serial_average_calculator(serialNo))
    end

    def test_SerialNo_case_2

        serialNo = "002-10.00-08.00"
        assert_equal("002-09.00", serial_average_calculator(serialNo))
    end

    def test_SerialNo_case_3

        serialNo = "002-00.00-00.00"
        assert_equal("002-00.00", serial_average_calculator(serialNo))
    end
  
end