class CreateUnidomCategories < ActiveRecord::Migration

  def change

    create_table :unidom_categories, id: :uuid do |t|

      t.references :scheme, type: :uuid, null: false

      t.string :code,         null: true,  default: nil, limit: 64
      t.string :name,         null: false, default: '',  limit: 200
      t.string :abbreviation, null: true,  default: nil, limit: 16

      t.text :description

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_categories, :scheme_id
    add_index :unidom_categories, [ :code, :scheme_id ], unique: true

  end

end
