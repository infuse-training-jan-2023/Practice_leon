
require 'rubygems'
require 'json'




class JsonFormater

    def initialize(string)
        @jsonData= JSON.parse(string)
    end

    def print_Json_str()
    
        puts @jsonData


    end


end


jsonString='{
    "President": "Alan Isaac",
    "CEO": "David Richardson"   
}'


formater = JsonFormater.new(jsonString)

formater.print_Json_str


