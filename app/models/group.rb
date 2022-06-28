class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy
    enum group_type: [:Boygroup, :GirlsGroup, :Band]

    def cant_concert
        self.concerts.count
    end

    def concert_moth
        this_month = Time.now.month
        self.concerts.select{|m| m.date.month == this_month}.count
    end

    def concert_last
        #self.concerts.map{|c| c.date }.last.strftime("%Y %B %A")
        aux = self.concerts.map{|c| c.date }.last
        if aux.nil?
            aux = " "
        else
            aux.strftime("%Y %B %A")
        end
    end

    def attendance_max
        self.concerts.map{|c| c.attendance}.max
    end

    def duration_max
        self.concerts.map{|c| c.duration}.max
    end



end
