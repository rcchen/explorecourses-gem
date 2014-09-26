module ExploreCourses

    class Course
        
        def initialize(year, subject, code, title, description, gers, repeatable, grading, units_min, 
                units_max, sections)
            @year = year
            @subject = subject
            @code = code
            @title = title
            @description = description
            @gers = gers
            @repeatable = repeatable
            @grading = grading
            @units_min = units_min
            @units_max = units_max
            @sections = sections
        end

        attr_reader :year, :subject, :code, :title, :description, :gers, :repeatable, :grading, :units_min, 
                :units_max, :sections

    end

end
