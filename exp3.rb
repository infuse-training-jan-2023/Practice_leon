
Myhash = {"x" => 67, "f" => "abc", 6 => 21}





def add_to_hash(hsh, key , value)
    hsh.store(key , value)

    return hsh
end


def clear_non_int_keys(hsh)
    hsh.each do |key, value|
      
        hsh.delete_if {|key, value| !key.is_a?(Integer)}
    end
    return hsh
end


def delete_even_keys(hsh)

    hsh.each do |key, value|
       
        if(key.is_a?(Integer))
            hsh.delete_if {|key, value| key.even?}
        end
     end
     return hsh

end



puts add_to_hash(Myhash, 543121 ,100)
puts clear_non_int_keys(Myhash)
puts delete_even_keys(Myhash)
