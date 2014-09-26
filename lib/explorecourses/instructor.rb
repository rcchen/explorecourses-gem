module ExploreCourses
   
    class Instructor

        def initialize(name, first_name, middle_name, last_name, sunet, role)
            @name = name
            @first_name = first_name
            @middle_name = middle_name
            @last_name = last_name
            @sunet = sunet
            @role = role
        end

        attr_reader :name, :first_name, :middle_name, :last_name, :sunet, :role

    end

end
