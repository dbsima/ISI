class Audit < ActiveRecord::Base
   def self.levels
      ['dezactivat', 'angajat', 'sef de departament', 'sef de divizie', 'director']
   end
end
