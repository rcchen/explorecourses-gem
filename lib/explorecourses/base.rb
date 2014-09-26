require 'nokogiri'
require 'typhoeus'

module ExploreCourses

    URL_BASE_SEARCH = "http://explorecourses.stanford.edu/search?"
    XML_VERSION = "xml-20140630"

    def self.check_xml_version
        request = Typhoeus::Request.new(URL_BASE_SEARCH, params: { view: XML_VERSION })
        request.run
        response = request.response
        if response
            doc = Nokogiri::XML(response.body)
            return { deprecated: doc.at_xpath("//deprecated").content,
                    latest_version: doc.at_xpath("//latestVersion").content}
        end
    end

    def self.query_courses(query)
        params = {
            view: XML_VERSION,
            q: query
        }
        request = Typhoeus::Request.new(URL_BASE_SEARCH, params: params)
        request.run
        response = request.response
        if response
            doc = Nokogiri::XML(response.body)
            # use XPath to navigate the XML body
            courses_xml = doc.xpath(".//course")
            courses = []
            courses_xml.each do |course_xml|
                year = course_xml.at_xpath(".//year").content
                subject = course_xml.at_xpath(".//subject").content
                code = course_xml.at_xpath(".//code").content
                title = course_xml.at_xpath(".//title").content
                description = course_xml.at_xpath(".//description").content
                gers = course_xml.at_xpath(".//gers").content
                repeatable = course_xml.at_xpath(".//repeatable").content
                grading = course_xml.at_xpath(".//grading").content
                units_min = course_xml.at_xpath(".//unitsMin").content
                units_max = course_xml.at_xpath(".//unitsMax").content
                sections = retrieve_sections(course_xml.xpath(".//section"))
                courses << Course.new(year, subject, code, title, description, gers, repeatable,
                        grading, units_min, units_max, sections)
            end
            return courses
        end
    end

    private

    def self.retrieve_sections(sections_xml)
        sections = []
        sections_xml.each do |section_xml|
            class_id = section_xml.at_xpath(".//classId").content
            term = section_xml.at_xpath(".//term").content
            term_id = section_xml.at_xpath(".//termId").content
            subject = section_xml.at_xpath(".//subject").content
            code = section_xml.at_xpath(".//code").content
            units = section_xml.at_xpath(".//units").content
            section_number = section_xml.at_xpath(".//sectionNumber").content
            component = section_xml.at_xpath(".//component").content
            num_enrolled = section_xml.at_xpath(".//numEnrolled").content
            max_enrolled = section_xml.at_xpath(".//maxEnrolled").content
            num_waitlist = section_xml.at_xpath(".//numWaitlist").content
            max_waitlist = section_xml.at_xpath(".//maxWaitlist").content
            enroll_status = section_xml.at_xpath(".//enrollStatus").content
            add_consent = section_xml.at_xpath(".//addConsent").content
            drop_consent = section_xml.at_xpath(".//dropConsent").content
            course_id = section_xml.at_xpath(".//courseId").content
            schedules = retrieve_schedules(section_xml.xpath(".//schedule"))
            sections << Section.new(class_id, term, term_id, subject, code, units, section_number, component, 
                    num_enrolled, max_enrolled, num_waitlist, max_waitlist, enroll_status, add_consent, 
                    drop_consent, course_id, schedules)
        end
        return sections
    end

    def self.retrieve_schedules(schedules_xml)
        schedules = []
        schedules_xml.each do |schedule_xml|
            start_date = schedule_xml.at_xpath(".//startDate").content
            end_date = schedule_xml.at_xpath(".//endDate").content
            start_time = schedule_xml.at_xpath(".//startTime").content
            end_time = schedule_xml.at_xpath(".//endTime").content
            location = schedule_xml.at_xpath(".//location").content
            # Cleaning up after whoever put all the \t and \n in the string...
            days = schedule_xml.at_xpath("./days").content.gsub(/[\t\n]/, ' ').split.join(',')
            instructors = retrieve_instructors(schedule_xml.xpath(".//instructor"))
            schedules << Schedule.new(start_date, end_date, start_time, end_time, location, days, instructors)
        end
        return schedules
    end

    def self.retrieve_instructors(instructors_xml)
        instructors = []
        instructors_xml.each do |instructor_xml|
            name = instructor_xml.at_xpath(".//name").content
            first_name = instructor_xml.at_xpath(".//firstName").content
            middle_name = instructor_xml.at_xpath(".//middleName").content
            last_name = instructor_xml.at_xpath(".//lastName").content
            sunet = instructor_xml.at_xpath(".//sunet").content
            role = instructor_xml.at_xpath(".//role").content
            instructors << Instructor.new(name, first_name, middle_name, last_name, sunet, role)
        end
        return instructors
    end

end
