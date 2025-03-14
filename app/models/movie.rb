# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  belongs_to :director, class_name: "Director"

  has_many :characters, class_name: "Character"
  has_many :cast, through: :characters, source: :actor

  validates(:director_id, presence: true)
  validates(:title, uniqueness: true)
end
