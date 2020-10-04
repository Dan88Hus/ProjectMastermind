class MMastermind
    @@ask = "color you pick-up within Red-Green-Blue-White : ie.r"
    def initialize
      @user_color_hash= Hash.new()
      @cpu_color_arr= ["r", "g","b", "w"]
      @ccolor_hash = {}
  
    end
    
    def start
      p "welcome this is start"
      p "=============="
      ask_color
    end
    # computer random selection color process
    def cpu_guess
      puts "----CPU gets color----"
      i= 1
      until i==@cpu_color_arr.length+1 do
        a= @cpu_color_arr.sample
        @ccolor_hash[i] = a
        i +=1
      end
      puts "------------------"
      # puts @ccolor_hash
      ask_color
    end
  
    # user selection color process
    def ask_color
      p "---this is ask_color section----"
      i= 1
      until i== @cpu_color_arr.length+1 do
        puts "#{i}. #{@@ask}"
        @user_color_hash[i] = gets.chomp.to_s
        i += 1
      end
      compare_hashes
      
    end
  
    def compare_hashes
      cch = @ccolor_hash
      uch = @user_color_hash
      # puts "---------compare section begins-----"
      # puts "uchindex"
      # uchindex = uch.each { |v,i| puts "index is : #{v} and value is: #{i}"}
      # puts "-----cchindex"
      # cchindex = cch.each { |v,i| puts "index is : #{v} and value is: #{i}"}
      puts "-------"
      i=1
      nf=0
      
        (uch.keys && cch.keys).each {|k,v| if (uch[k]==cch[k]) 
         puts "#{uch[k]} Red pin" 
        else puts "Not Found! so No pin" 
        nf +=1
        # puts nf
        end}
        if nf == 0 
          puts "you won"
        else
          puts "you needed #{nf} different color from you chosed "
        end
        puts " Do you want 1 more round? (y)"
        answer = gets.chomp.to_s
        p answer.to_s
        if answer=="y"
          one_more
        end
        
    end
        def one_more
        cpu_guess
        end
  
  
  
  end
  
  mmg = MMastermind.new
  mmg.cpu_guess
