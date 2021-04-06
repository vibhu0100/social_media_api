class AddOtpCounterToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :otp_counter, :integer
  end
end
