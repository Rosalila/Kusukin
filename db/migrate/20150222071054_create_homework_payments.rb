class CreateHomeworkPayments < ActiveRecord::Migration
  def change
    create_table :homework_payments do |t|
      t.references :user, index: true
      t.references :homework, index: true

      t.timestamps null: false
    end
    add_foreign_key :homework_payments, :users
    add_foreign_key :homework_payments, :homeworks
  end
end
