class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    
  end

  def faucet
   
    if current_user.account >= 100
      current_user.update(account: 100)
      flash.alert= "your account is full !"
      redirect_to request.referrer
    else
      @dice = rand(1...50)
      x = current_user.account + @dice
      current_user.update(account: x)
  
      
      flash.alert= "your account is empty !"
      redirect_to request.referrer

    end
    #  flash[:notice] = "tu à obtenu #{@dice}"
    
   
  end

  def product
    @price  = rand(1...20)
    if current_user.account < @price
      flash.alert= "your account not enough !"
      redirect_to request.referrer
    else
     y = current_user.account - @price
     current_user.update(account: y)
     flash.alert= "purchase sucess !"
     redirect_to request.referrer
    end
  end

  # def new

  # end

  # def edit
  
  # end

  # def create

  # end

  # def update
  # end

  def destroy
    @user.destroy
    redirect_to root_path
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).params(:email, :password)
  end
end
