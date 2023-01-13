class LeasesSerializer < ActiveModel::Serializer
  attributes :rent

  has_one :apartment, serializer: ApartmentSerializer
  has_one :tenant, serializer: TenantsSerializer
end
