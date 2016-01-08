class CreateUnidomCategorizings < ActiveRecord::Migration

  def change

    create_table :unidom_categorizings, id: :uuid do |t|

      t.references :category,    type: :uuid, null: false
      t.references :categorized, type: :uuid, null: false,
        polymorphic: { type: :uuid, null: false }

      t.boolean :elemental, null: false, default: false

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_categorizings, :category_id
    add_index :unidom_categorizings, :categorized_id

  end

end
