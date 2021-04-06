class RemoveOtpCounterFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :otp_counter, :integer
  end
end
