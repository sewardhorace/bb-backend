module Api
  module V1
    class ReportsController < Api::V1::ApiController
      skip_before_filter :verify_authenticity_token
      # TODO authenticity token

      def index
        @reports = Report.all
        render json: @reports, root: false
      end

      def create
        @report = Report.new(report_params)
        @report.completed = false
        if @report.save
          head :ok
        else
          head :bad_request
        end
      end

      def update
        @report = Report.find(params[:id])

        if @report.update(report_params)
          head :ok
        else
          head :bad_request
        end
      end

      def destroy
        @report = Report.find(params[:id])
        @report.destroy
        head :ok
      end

      private
      def report_params
        params.require(:report).permit()
      end
    end
  end
end
