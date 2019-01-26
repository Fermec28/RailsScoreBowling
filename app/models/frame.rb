class Frame < ApplicationRecord    
    has_many :tries
    belongs_to :line
    enum type_frame: [ :normal, :strike,:spare ]    
    
    
    def sum_tries
        self.tries.sum(:value)
    end

    def can_make_try?          
        self.tries.empty? || (self.tries.first.value < NUM_PINES && self.tries.count < 2 )|| (self.last_frame &&   ((self.sum_tries % NUM_PINES) == 0 ) && self.tries.count  < 3 )
    end

    def make_try(value)
        if self.can_make_try?
            
            if self.last_frame
                if  (self.sum_tries % NUM_PINES == 0 && NUM_PINES - value >= 0)
                    self.tries.create(value:value) 
                elsif (self.tries.length==1 && NUM_PINES- (self.sum_tries+value) >= 0)
                    self.tries.create(value:value) 
                end
            else 
                if (NUM_PINES- (self.sum_tries+value) >= 0 )
                    self.tries.create(value:value)
                end
            end
        end
    end
end
