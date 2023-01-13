class TenantsSerializer < ActiveModel::Serializer
  attributes :name, :age

  has_many :leases, serializer: LeasesSerializer
  has_many :apartments, through: :leases

end
