class Lease < ApplicationRecord
    belongs_to :apartment
    belongs_to :tenant
    
    validates_presence_of :rent, :apartment_id, :tenant_id
end
