class Todolist < ApplicationRecord
  validates :todo, presence: true, length: { minimum: 5 }
end
