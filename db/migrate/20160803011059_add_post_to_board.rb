class AddPostToBoard < ActiveRecord::Migration
  def change
    add_reference :boards, :post, index: true, foreign_key: true
  end
end
