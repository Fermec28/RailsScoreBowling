class Line < ApplicationRecord
    extend CalculateScore
    has_many :frames
    has_many :tries, through: :frames
    after_create :initialize_frames

    

    def populate_frames(array)
        self.frames.each do |frame|
            while (frame.can_make_try? && !array.empty?)
                frame.make_try(array.shift)
            end
        end
    end

    def to_calculate_score
        self.simple_score
    end

    def simple_score        
        self.tries.sum(:value)
    end
    private
    def initialize_frames
        10.times do |n|
            self.frames.create unless n==9
            self.frames.create(last_frame:true) if n==9
        end

    end

    
end
