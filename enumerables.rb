class Array
    def my_each(&prc)
        i = 0
            while i < self.length
                prc.call(self[i])
                i += 1
            end
        self
    end

    def my_select(&prc)
        new_array = []
        self.my_each{ |ele| new_array << ele if prc.call(ele)}
        new_array
    end

    def my_reject(&prc)
        new_array = []
        self.my_each{ |ele| new_array << ele unless prc.call(ele)}
        new_array
    end

    def my_any?(&prc)
        self.my_each{|el| return true if prc.call(el)}
        false
    end

    def my_all?(&prc)
        self.my_each{|el| return false unless prc.call(el)}
        true
    end

    def my_flatten
        new_array = []
        self.my_each do |el|
            if el.class == Array
                new_array += el.my_flatten
            else new_array += [el]
            end
        end
        new_array
    end
end