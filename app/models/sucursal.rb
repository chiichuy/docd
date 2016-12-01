class Sucursal < ActiveRecord::Base
  belongs_to :user
  has_many :empleados
end
