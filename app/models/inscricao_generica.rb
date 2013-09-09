class InscricaoGenerica < ActiveRecord::Base
  belongs_to :inscrevivel, polymorphic: true
  has_many :titulos
end
