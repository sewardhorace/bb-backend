class Api::V1::StudentsController < Api::V1::ApiController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  # skip_before_filter :verify_authenticity_token
  # TODO csrf token

  def index
    students = Student.all
    render json: students, root: false
  end
end
