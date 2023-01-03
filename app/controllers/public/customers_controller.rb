class Public::CustomersController < ApplicationController
  def my_page
    @customers = current_customer
  end
  
  def edit
     @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
     redirect_to my_page_customers_path(@customer.id)
  end
  
  def unsubscribe
     @customer = Customer.find_by(email: params[:name])
  end
  
  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    sign_out current_customer
    redirect_to root_path
  end
  
  private
  
   def customer_params
    params.require(:customer).permit(:email, :reset_password_token, :reset_password_sent_at, :remember_created_at,:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
   end
  
end