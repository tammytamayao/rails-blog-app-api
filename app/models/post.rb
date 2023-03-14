class Post < ApplicationRecord

    has_many :comments
    has_many :likers

    validates :title, presence: true, uniqueness: true, length: { minimum: 1, maximum: 140}
    validates :body, presence: true
end
