module ExploreCourses

    class Section

        def initialize(class_id, term, term_id, subject, code, units, section_number, component, num_enrolled, 
            max_enrolled, num_waitlist, max_waitlist, enroll_status, add_consent, drop_consent, course_id, schedules)
            @class_id = class_id
            @term = term
            @term_id = term_id
            @subject = subject
            @code = code
            @units = units
            @section_number = section_number
            @component = component
            @num_enrolled = num_enrolled
            @max_enrolled = max_enrolled
            @num_waitlist = num_waitlist
            @max_waitlist = max_waitlist
            @enroll_status = enroll_status
            @add_consent = add_consent
            @drop_consent = drop_consent
            @course_id = course_id
            @schedules = schedules
        end

        attr_reader :class_id, :term, :term_id, :subject, :code, :units, :section_number, :component, 
                :num_enrolled, :max_enrolled, :num_waitlist, :max_waitlist, :enroll_status, :add_consent,
                :drop_consent, :course_id, :schedules

    end

end
