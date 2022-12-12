class RemoveBookingIdFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :booking_id, :bigint
  end
end
