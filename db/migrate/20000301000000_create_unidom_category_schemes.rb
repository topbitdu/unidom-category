class CreateUnidomCategorySchemes < ActiveRecord::Migration

  def change

    create_table :unidom_category_schemes, id: :uuid do |t|

      t.references :owner, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.string  :name,       null: false, default: '', limit: 200
      t.boolean :using_code, null: false, default: false

      t.text :description

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_category_schemes, :owner_id

  end

end
