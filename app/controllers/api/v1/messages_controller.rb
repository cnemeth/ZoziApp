module Api
  module V1
    class MessagesController < Api::V1::BaseController

      # GET /api/v1/messges
      def index
        messages = Message.all
        render json: messages
      end

      # POST /api/v1/messges
      def create
        message = Message.new(message_params)

        if message.save
          MakeTag.new(message).call if message.body.include?('#')
          render json: message, status: :created
        else
          #render_error(message, :unprocessable_entity)
          render json: message.errors, status: :unprocessable_entity
        end
      end

      private

      def message_params
        params.require(:message).permit(:body)
      end
    end
  end
end
