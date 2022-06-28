class CreateTableGems < ActiveRecord::Migration[7.0]
  def change
    create_table :table_gems do |t|

      t.timestamps
    end
  end
end
