class OrderinfoController < ApplicationController
	before_action :new_orderinfo
	def index

	end

	def create
    end

	private

	def new_orderinfo
	  @orderinfo = current_order
    end
end
