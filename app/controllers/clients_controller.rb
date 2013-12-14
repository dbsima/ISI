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
  end
  
  def destroy
     Client.find(params.require(:id)).destroy
     
     redirect_to :clients, alert: 'Client sters'
  end
end
