class RenameTranmissionToTransmission < ActiveRecord::Migration[7.0]
  def change
    rename_column :cars, :tranmission, :transmission
  end
end
