# frozen_string_literal: true

class CreateCitizenRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :citizen_roles do |t|
      t.bigint :account_id, null: false
      t.string :name, null: false
      t.json :capabilities, null: false, default: []

      t.timestamps
    end

    add_index :citizen_roles, :account_id
  end
end
