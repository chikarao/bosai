class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :request, optional: true 
end
