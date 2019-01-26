class Try < ApplicationRecord
    validates :value, :inclusion => 0..10
end
