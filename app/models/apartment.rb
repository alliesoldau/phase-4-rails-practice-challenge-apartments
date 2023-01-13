class Apartment < ApplicationRecord
    has_many :leases
    has_many :tenants, through: :leases, dependent: :destroy
    
    validates_presence_of :number
end
