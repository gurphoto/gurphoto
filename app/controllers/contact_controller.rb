# encoding: utf-8

class ContactController < ApplicationController
  def new
    @message = ContactMessage.new
  end

  def create
    @message = ContactMessage.new params[:contact_message]

    if @message.save_with_captcha
      redirect_to root_path, notice: 'Ваше сообщение успешно отправлено.'
      return
    end

    render :new
  end
end
