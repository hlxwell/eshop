class CreateSettings < ActiveRecord::Migration
    def self.up
        create_table :settings do |t|
            t.string :key
            t.string :value
            t.timestamps
        end

        Setting.create(:key=>'admin_username',:value=>'admin')
        Setting.create(:key=>'admin_password',:value=>'123321')
    end

    def self.down
        drop_table :settings
    end
end
