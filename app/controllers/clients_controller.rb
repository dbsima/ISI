class ClientsController < DeptChiefController
  def index
     @clients = Client.all
  end

  def new
  end
  
  def create
     client = params.require(:client).require(:name)
     
     Client.create name: client
     
     redirect_to :clients, alert: 'Client creat'
  end

  def edit
     @client = Client.find(params.require(:id))
  end
  
  def update
     client = Client.find(params.require(:id))
     client.name = params.require(:client).require :name
     client.save
     
     redirect_to :clients, alert: 'Client modificat'
  end
  
  def destroy
     Client.find(params.require(:id)).destroy
     
     redirect_to :clients, alert: 'Client sters'
  end
end
