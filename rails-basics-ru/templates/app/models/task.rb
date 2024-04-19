# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, :creator, :status, presence: true
  attribute :status, default: 'New'
  attribute :completed, default: false
end
