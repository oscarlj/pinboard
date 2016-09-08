class AddNationalityToUser < ActiveRecord::Migration
  def change
    add_reference :users, :nationality, index: true, foreign_key: true
  end
end
