module CalculateScore
    
    def string_2_array(str)
        str.split('').map.with_index do |element,index|
            case element
            when 'X'
                10
            when '-'
                0
            when '/'
                10-(str.split('')[index-1].to_i)
            else 
                element.to_i
            end  
        end
    end
    
end