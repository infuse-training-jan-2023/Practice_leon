
class SkipSports
    def skip_sports(sports_array , skipLen)
        if( skipLen <=sports_array.length && skipLen >=0)
            return sports_array[skipLen , sports_array.length]  
        else
            return "index out of Bounds"
        end

    end
end

skip_sports= ['cricket' , 'TT' , 'Football' , 'hockey']

obj = SkipSports.new

puts obj.skip_sports(skip_sports , 2)