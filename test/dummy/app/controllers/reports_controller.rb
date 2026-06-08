# frozen_string_literal: true

class ReportsController < ApplicationController
  include Citizen::Authorization

  before_action { Citizen::Current.account_id = params[:account_id] }

  def show
  end

  private

  def current_member
    Member.find(params[:member_id])
  end
end
