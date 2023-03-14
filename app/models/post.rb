class Post < ApplicationRecord
    validates :title, presence: true, uniqueness: true, length: { minimum: 1, maximum: 140}
    validates :body, presence: true
end
