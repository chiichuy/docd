class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :puesto
      t.string :rfc
      t.references :sucursal, index: true

      t.timestamps
    end
  end
end
