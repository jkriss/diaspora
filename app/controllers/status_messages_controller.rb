#   Copyright (c) 2010, Disapora Inc.  This file is
#   licensed under the Affero General Public License version 3.  See
#   the COPYRIGHT file.


class StatusMessagesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html
  respond_to :json, :only => :show

  def create
    params[:status_message][:to] = params[:aspect_ids]
    @status_message = current_user.post(:status_message, params[:status_message])
    respond_with @status_message
  end
  
  def destroy
    @status_message = StatusMessage.find_by_id params[:id]
    @status_message.destroy
    respond_with :location => root_url
  end
  
  def show
    @status_message = StatusMessage.find_by_id params[:id]
    respond_with @status_message
  end
end
