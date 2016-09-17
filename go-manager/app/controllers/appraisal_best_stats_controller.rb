class AppraisalBestStatsController < ApplicationController
  before_action :set_appraisal_best_stat, only: [:show]

  # GET /appraisal_best_stats
  # GET /appraisal_best_stats.json
  def index
    @appraisal_best_stats = AppraisalBestStat.all
  end

  # GET /appraisal_best_stats/1
  # GET /appraisal_best_stats/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appraisal_best_stat
      @appraisal_best_stat = AppraisalBestStat.find(params[:id])
    end


end
