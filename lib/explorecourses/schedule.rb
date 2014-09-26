module ExploreCourses

    class Schedule

        def initialize(start_date, end_date, start_time, end_time, location, days, instructors)
            @start_date = start_date
            @end_date = end_date
            @start_time = start_time
            @end_time = end_time
            @location = location
            @days = days
            @instructors = instructors
        end

        attr_reader :start_date, :end_date, :start_time, :end_time, :location, :days, :instructors

    end

end
