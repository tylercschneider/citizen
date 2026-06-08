# frozen_string_literal: true

class CreateCitizenAssignments < ActiveRecord::Migration[8.1]
  def change
    create_table :citizen_assignments do |t|
      t.references :member, polymorphic: true, null: false
      t.references :role, null: false

      t.timestamps
    end

    add_index :citizen_assignments, %i[member_type member_id role_id], unique: true,
      name: "index_citizen_assignments_unique"
  end
end
