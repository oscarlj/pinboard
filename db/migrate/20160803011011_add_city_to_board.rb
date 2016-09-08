class AddCityToBoard < ActiveRecord::Migration
  def change
    add_reference :boards, :city, index: true, foreign_key: true
  end
end
