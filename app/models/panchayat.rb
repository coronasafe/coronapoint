# frozen_string_literal: true

class Panchayat < ApplicationRecord
  has_many :contacts
  has_many :users
  has_many :houses

  belongs_to :district
end
