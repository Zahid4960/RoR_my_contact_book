class ContactBooksController < ApplicationController

  require_relative '../services/contact_book_service'

  def index
    begin
      @limit = params['limit'] != nil ? params['limit'] : 10
      @lists = contact_book_service.index(params[:page], @limit)
      if @lists.length > 0
        render json: { status: "success", message: "Contacts found!!!", data: @lists }
      else
        render json: { status: "success", message: "Contacts not found!!!", data: @lists }
      end
    rescue => error
      render json: { status: "error", message: "Exception appear to fetching contacts!!!", exception: error.message }
    end
  end

  def create
    begin
      @data = contact_book_service.create(contact_book_params)
      render json: { status: 'success', message: 'Contact saved successfully!!!', data: contact_book_service.show(@data.id) }
    rescue => error
      render json: { status: "error", message: "Exception appear contact failed to save!!!", exception: error.message }
    end
  end

  def show
    begin
      @office_by_id = contact_book_service.show(params[:id])
      render json: { status: "success", message: "Contact Found!!!", data: @office_by_id }
    rescue => error
      render json: { status: "error", message: "Exception appears contact not found!!!", exception: error.message }
    end
  end

  def update
    begin
      @data = contact_book_service.update(params[:id], contact_book_params)
      render json: { status: "success", message: "Contact updated successfully!!!", data: contact_book_service.show(params[:id]) }
    rescue => error
      render json: { status: "error", message: "Exception appear contact failed to update!!!", exception: error.message }
    end
  end

  def destroy
    begin
      @data = contact_book_service.destroy(params[:id])
      render json: { status: "success", message: "Contact deleted successfully!!!" }
    rescue => error
      render json: { status: "error", message: "Exception Appear failed to delete contact!!!", exception: error.message }
    end
  end

  def contact_book_params
    params.permit(:first_name, :last_name, :sex, :age, :dop, :email, :address, :contact_no)
  end

  private
  def contact_book_service
    @service = ContactBookService.new
  end
end
