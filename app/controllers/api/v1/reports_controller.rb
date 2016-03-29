
class Api::V1::ReportsController < Api::V1::ApiController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  # skip_before_filter :verify_authenticity_token
  # TODO csrf token

  def index
    reports = Report.all
    if query = search_params[:query_string]
      reports = reports.search(query)
    end
    render json: reports, root: false
  end


  def create
    if report = Report.newReportFromParams(report_params, current_user)
      render json: report, status: 201
    else
      #TODO return a more detailed explaination
      head :bad_request
    end
  end

  def update
    report = Report.find(params[:id])
    #TODO not up to date
    if report.updateReportFromParams(report_params)
      head :ok
    else
      head :bad_request
    end
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    head :ok
  end

  private
  def report_params
    params.require(:report).permit(:title, :description, :room_id, :time, :students => [:id])
  end

  def search_params
    params.permit(:query_string)
  end
end
