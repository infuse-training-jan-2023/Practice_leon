require 'test/unit'
require_relative 'exp3'
class TestExp3 < Test::Unit::TestCase
     Myhash = {"x" => 67, "f" => "abc", 6 => 21} 
    def test_add_to_hash         
        assert_equal({"x"=>67, "f"=>"abc", 6=>21, 543121=>100}, add_to_hash(Myhash, 543121 ,100))
    end

    def test_clear_non_int_keys    
        assert_equal({6=>21, 543121=>100}, clear_non_int_keys(Myhash))
    end

    def test_delete_even_keys        
        assert_equal({543121=>100},  delete_even_keys(Myhash))
    end


end