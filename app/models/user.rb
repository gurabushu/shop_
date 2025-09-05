class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

         #ageは生の自然数のみ許可
         validates :age, numericality: { only_integer: true, greater_than: 0, less_than: 150 }, allow_blank: true


end
