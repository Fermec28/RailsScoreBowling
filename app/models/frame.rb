class Frame < ApplicationRecord
    enum type_frame: [ :normal, :strike,:spare ]
end
