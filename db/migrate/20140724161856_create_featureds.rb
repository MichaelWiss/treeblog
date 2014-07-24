class CreateFeatureds < ActiveRecord::Migration
  def change
    create_table :featureds do |t|

      t.timestamps
    end
  end
end
