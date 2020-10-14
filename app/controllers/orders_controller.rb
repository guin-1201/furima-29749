class OrdersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def create
  end

end


private

  def move_to_index
    unless user_signed_in?
      return redirect_to new_user_session_path
    end
  end
end