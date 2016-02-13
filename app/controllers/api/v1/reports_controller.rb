
class Api::V1::ReportsController < Api::V1::ApiController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  # skip_before_filter :verify_authenticity_token
  # TODO csrf token

  def index
    reports = Report.all
    render json: reports, root: false
  end

  def create
    #need reference to room, students (& student_report), user (author)
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
    if report.update(report_params)
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
end
