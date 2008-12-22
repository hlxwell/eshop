class Setting < ActiveRecord::Base
    def self.get(key)
        setting = Setting.find_by_key(key)
        if setting
            setting.value
        else
            return nil
        end
    end

    def self.set(key,value)
        setting = Setting.find_by_key(key)
        if setting
            setting.value = value
            setting.save
        else
            Setting.create(:key=>key,:value=>value)
        end
    end
end