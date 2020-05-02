# frozen_string_literal: true
class Application < ApplicationRecord
  belongs_to :user
  has_many :houses
  has_many :vehicles
  has_many :contacts
end
