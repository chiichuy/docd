class CreateSucursals < ActiveRecord::Migration
  def change
    create_table :sucursals do |t|
      t.string :nombre
      t.string :calle
      t.string :colonia
      t.integer :numeroExterior
      t.integer :numeroInterior
      t.integer :codigoPostal
      t.string :ciudad
      t.string :pais
      t.references :user, index: true

      t.timestamps
    end
  end
end
