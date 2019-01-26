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
        if self.frame.tries.count==2 &&  (self.frame.tries.first.value + self.frame.tries.second.value == 10)
            self.frame.update(type_frame: "spare")
        end
    end
end
