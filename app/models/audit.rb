class Audit < ActiveRecord::Base
   def self.levels
      {'dezactivat' => 100, 'angajat' => 16, 'sef de departament' => 8, 'sef de divizie' => 4, 'director' => 2}
   end
end
