require 'pry'

def nyc_pigeon_organizer(pigeon_data)
  new_hash = {}
  pigeon_data.each do |trait_key, value_of_traits_as_hashes|  #color, {purple=>[bob, joe], green=>[joe, jane]}
    value_of_traits_as_hashes.each do |trait_value, array_of_names|  #purple, [bob, joe]
      array_of_names.each do |name|#joe
        if new_hash.include?(name) #already has joe
          if new_hash[name].include?(trait_key)#already has joe's colors
            if new_hash[name][trait_key].include?(trait_value.to_s) == false #has joe's colors but does not have this color in it
              new_hash[name][trait_key] << trait_value.to_s #then just add this color to his color array
            end #if has joe's colors and this value is already in it, then do nothing
          else                                  #has joe, but not his colors (maybe has gender, etc)
            new_hash[name][trait_key] = [trait_value.to_s] #give joe a color array, and add the specific color to it
          end
        else  #newhash doesn't even have joe yet
          new_hash[name] = {}
          new_hash[name][trait_key] = []
          new_hash[name][trait_key] << trait_value.to_s #give joe a hash, point to a color array, insert this color
        end
      end
    end
  end
  new_hash
end
