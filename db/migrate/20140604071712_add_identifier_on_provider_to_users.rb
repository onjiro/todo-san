class AddIdentifierOnProviderToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :identifier_on_provider
    end
  end
end
