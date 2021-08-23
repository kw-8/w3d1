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

    def my_zip(*args)
        new_array = Array.new(self.length){ Array.new }
        
        (0...self.length).to_a.my_each do |i|
            new_array[i] << self[i]
            args.each{|arg| new_array[i] << arg[i]}
        end
        new_array
    end

    def my_rotate(n=1)
        n = self.length + n if n < 0
        n = n % self.length

        result = self[n..-1] + self[0...n]
    end

    def my_join(str="")
        new_str = ""
        self.my_each do |ele|
            new_str += (ele + str)
        end
        new_str[0...-str.length]
    end

    def my_reverse
        new_arr = []
        self.my_each do |ele|
            new_arr = [ele] + new_arr
        end
        new_arr
    end
end