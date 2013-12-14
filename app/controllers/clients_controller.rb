class ClientsController < DeptChiefController
  def index
     @clients = Client.all
  end

  def new
  end
  
  def create
     client = params.require(:client).require(:name)
     
     Client.create name: client
     
     audit "a creat clientul #{client}"
     redirect_to :clients, alert: 'Client creat'
  end

  def edit
     @client = Client.find(params.require(:id))
  end
  
  def update
     client = Client.find(params.require(:id))
     old_name = client.name
     client.name = params.require(:client).require :name
     client.save
     
     audit "a modificat clientul #{old_name} cu id-ul #{client.id} in #{client.name}"
     redirect_to :clients, alert: 'Client modificat'
  end
  
  def destroy
     client = Client.find(params.require(:id))
     audit "a sters clientul #{client.name} cu id: #{client.id}"
     client.destroy
     
     redirect_to :clients, alert: 'Client sters'
  end
end
