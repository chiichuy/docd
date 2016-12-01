class EmpleadoController < ApplicationController

  def new
    @user = User.find(session[:currentUser])

    @l_empleado = Empleado.new()
    @l_sucursales = Sucursal.where(user_id: session[:currentUser])
  end
  def edit
    @user = User.find(session[:currentUser])

    @l_empleado = Empleado.find(params[:id])
    @l_sucursales = Sucursal.where(user_id: session[:currentUser])
    render "new"
  end


  def save
    # render plain: params
    if params[:id] == nil
      empleado = Empleado.new(params[:empleado].permit!)
      empleado.save
    else
      empleado = Empleado.update(params[:id], params[:empleado].permit!)
    end



    redirect_to '/'
  end
end
