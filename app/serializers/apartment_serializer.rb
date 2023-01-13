class ApartmentSerializer < ActiveModel::Serializer
  attributes :number

  has_many :leases, serializer: LeasesSerializer
  has_many :tenants, through: :leases
end
