class Library < ApplicationRecord
    has_many :returns
    has_many :overdrafts
end
