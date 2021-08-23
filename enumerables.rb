class Array
    def my_each(&prc)
        self.map!{|el| prc.call(el)}
    end

    def my_select(&prc)
        new_array = []
    end
end