class Try < ApplicationRecord
    belongs_to :frame
    validates :value, :inclusion => 0..10

    after_create :set_strike, :set_spare


    private
    def set_strike    
        if self.value == 10 && self.frame.tries.count == 1
            self.frame.update(type_frame: "strike")
        end       
    end

    def set_spare
        first_value = self.frame.tries.first.value ? self.frame.tries.first.value : 0
        second_value=  self.frame.tries.second ? self.frame.tries.second.value : 0
        if self.frame.tries.count==2 &&  (first_value + second_value == 10)
            self.frame.update(type_frame: "spare")
        end
    end
end
