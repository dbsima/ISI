require 'rest_client'
require 'irb'
require 'json'

# Client pt api
def extra(id_ang, data_start = nil, data_final = nil)
  r = RestClient.post 'http://localhost:3000/api/extra', {id: id_ang, data_start: data_start, data_final: data_final}

  if r.code == 200
    json = JSON.parse r.to_s

    p "Ore normale: #{json['norm']}"
    p "Ore extra: #{json['extra']}"
  else
    p JSON.parse(r.to_s)[:error]
  end
end

def concedii(id_ang, data_start = nil, data_final = nil)
  r = RestClient.post 'http://localhost:3000/api/concedii', {id: id_ang, data_start: data_start, data_final: data_final}
  if r.code == 200
    json = JSON.parse r.to_s

    p "Ore vacanta: #{json['holiday']}"
    p "Ore concediu medical: #{json['sick']}"
  else
    p JSON.parse(r.to_s)[:error]
  end
  return
end

p 'Mod utilizare'
p 'extra id_angajat data_start data_final'
p 'concedii id_angajat data_start data_final'
#IRB.conf[:PROMPT] = {}
#IRB.conf[:PROMPT][:DEFAULT] = {}
#IRB.conf[:PROMPT][:DEFAULT][:RETURN] = ""
#IRB.conf[:IRB_NAME]="Client Timesheet"

a=IRB.start
