



def nyc_pigeon_organizer(data)
  pigeon_name_array = []
  data.map{|outer_key,outer_value|
    outer_value.map{|inner_key,inner_value|
      inner_value.map{|element| 
        if !pigeon_name_array.include?(element)
          pigeon_name_array.push(element)
        end
      }
    }
  }
  
  #at this point we've created an array with unique names, next we need 
  #to create the new hash with everything except the inner values (which are in arrays)
  pigeon_list = {}
  pigeon_name_array.map{|element|
    pigeon_list[element] = {
      color: [],
      gender: [],
      lives: []
    }
  }
  
  #at this point we've created the new data structure skeleton,
  #but need to add the name-specific values to each array
  
  data.map{|outer_key,outer_value| 
      outer_value.map{|inner_key,inner_value|
          count = 0
          while count < inner_value.length do
            pigeon_list[inner_value[count]][outer_key].push(inner_key.to_s)
            count+=1
          end
        
      }
  }
  return pigeon_list
end

