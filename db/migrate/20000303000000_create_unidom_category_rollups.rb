class CreateUnidomCategoryRollups < ActiveRecord::Migration

  def change

    create_table :unidom_category_rollups, id: :uuid do |t|

      t.references :ancestor_category,   null: false, type: :uuid
      t.references :descendant_category, null: false, type: :uuid

      t.boolean :elemental, null: false, default: false
      t.integer :distance,  null: false, default: 1

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_category_rollups, :ancestor_category_id
    add_index :unidom_category_rollups, :descendant_category_id

  end

end
