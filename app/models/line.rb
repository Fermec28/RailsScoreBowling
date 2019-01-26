class Line < ApplicationRecord
    extend CalculateScore
    has_many :frames
    after_create :initialize_frames

    

    def populate_frames(array)
        self.frames.each do |frame|
            while (frame.can_make_try? && !array.empty?)
                p '*'*50
                p array
                frame.make_try(array.shift)
            end
        end
    end

    private
    def initialize_frames
        10.times do |n|
            self.frames.create unless n==9
            self.frames.create(last_frame:true) if n==9
        end

    end
end
