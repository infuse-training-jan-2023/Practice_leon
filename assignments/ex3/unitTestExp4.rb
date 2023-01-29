require 'test/unit'
require_relative 'exp4'
class TestExp4 < Test::Unit::TestCase
     


    def test_skip_sports_outOfRange_negative_len  
        skip_sports= ['cricket' , 'TT' , 'Football' , 'hockey']     
        assert_equal( "index out of Bounds", skip_sports(skip_sports,-1) )
    end


    def test_skip_sports_outOfRange_positive_len
        skip_sports= ['cricket' , 'TT' , 'Football' , 'hockey']     
        assert_equal( "index out of Bounds", skip_sports(skip_sports,9) )
    end

    def test_skip_sports_valid  
        skip_sports= ['cricket' , 'TT' , 'Football' , 'hockey']     
        assert_equal( ["Football", "hockey"], skip_sports(skip_sports,2) )
    end

end