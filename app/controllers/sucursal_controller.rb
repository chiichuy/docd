class SucursalController < ApplicationController
  def new
    @user = User.find(session[:currentUser])
    @l_sucursal = Sucursal.new()
  end

  def save
    empleados = params[:sucursal][:empleados]

    m_sucursal = params[:sucursal]
    m_sucursal.delete(:empleados)


    if params[:id] == nil
      sucursal = Sucursal.new(m_sucursal.permit!)
      sucursal.user_id = session[:currentUser]
      sucursal.save


      empleados.each{|key,value|
        if value[:nombre] != "" || value[:rfc] != "" || value[:puesto] != ""
          empleado = Empleado.new(value)
          empleado.sucursal = sucursal
          empleado.save
        end
      }
    else
      Sucursal.update(params[:id], m_sucursal.permit!)
    end




    redirect_to '/'

    # Empleado.new(empleados.permit!)
  end


  def edit
    @user = User.find(session[:currentUser])

      @l_sucursal = Sucursal.find(params[:id])

      render 'new'
  end
end