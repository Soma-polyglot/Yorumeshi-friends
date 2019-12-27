class Genre < ApplicationRecord
  has_many :posts
  has_ancestry
end
