# frozen_string_literal: true

class ReportsController < ApplicationController
  include Citizen::Authorization

  def show
  end

  private

  def current_member
    Member.find(params[:member_id])
  end
end
