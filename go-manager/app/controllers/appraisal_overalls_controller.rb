class AppraisalOverallsController < ApplicationController
  before_action :set_appraisal_overall, only: [:show]

  # GET /appraisal_overalls
  # GET /appraisal_overalls.json
  def index
    @appraisal_overalls = AppraisalOverall.all
  end

  # GET /appraisal_overalls/1
  # GET /appraisal_overalls/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appraisal_overall
      @appraisal_overall = AppraisalOverall.find(params[:id])
    end

end
