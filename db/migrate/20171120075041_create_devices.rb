
class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.belongs_to :user, index: true
      t.string :mac

      t.timestamps
    end
  end
end
