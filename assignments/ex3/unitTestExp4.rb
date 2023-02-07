require 'test/unit'
require_relative 'exp4'
class TestExp4 < Test::Unit::TestCase
     
    def test_skip_sports_outOfRange_negative_len  
        obj = SkipSports.new
        skip_sports= ['cricket' , 'TT' , 'Football' , 'hockey']     
        assert_equal( "index out of Bounds", obj.skip_sports(skip_sports,-1) )
    end

    def test_skip_sports_outOfRange_positive_len
        obj = SkipSports.new
        skip_sports= ['cricket' , 'TT' , 'Football' , 'hockey']     
        assert_equal( "index out of Bounds", obj.skip_sports(skip_sports,9) )
    end

    def test_skip_sports_valid  
        obj = SkipSports.new
        skip_sports= ['cricket' , 'TT' , 'Football' , 'hockey']     
        assert_equal( ["Football", "hockey"], obj.skip_sports(skip_sports,2) )
    end

end