module Api
  module V1
    class ClicksController < ApplicationController
      before_action :set_url

      def index
        @clicks = Click.where(url: @url)
      end

      private

        def set_url
          @url = Url.find(params[:url_id])
        end

        def click_params
          params.require(:click).permit(:browser, :platform, :created_at)
        end

    end
  end
end