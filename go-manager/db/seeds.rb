# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  

  # truncate all static data first if desired
  TRUNCATE_FIRST = true;
  if (TRUNCATE_FIRST) then
    TeamLeaderAppraisalBestStatPhrase.destroy_all
    TeamLeaderAppraisalOverallPhrase.destroy_all
    AppraisalBestStat.destroy_all
    AppraisalOverall.destroy_all

    TeamLeader.destroy_all
    Team.destroy_all
  end


# Team data

  Team.find_or_initialize_by(name: 'VALOR').update_attributes!(color: 'RED')
  Team.find_or_initialize_by(name: 'MYSTIC').update_attributes!(color: 'BLUE')
  Team.find_or_initialize_by(name: 'INSTINCT').update_attributes!(color: 'YELLOW')

  TeamLeader.find_or_initialize_by(name: 'CANDELA').update_attributes!(team_id: Team.find_by(name: 'VALOR').id)
  TeamLeader.find_or_initialize_by(name: 'BLANCHE').update_attributes!(team_id: Team.find_by(name: 'MYSTIC').id)
  TeamLeader.find_or_initialize_by(name: 'SPARK').update_attributes!(team_id: Team.find_by(name: 'INSTINCT').id)

# Appraisal data

  AppraisalOverall.find_or_initialize_by(appraisal_class: 'OVERALL_AMAZING').update_attributes!(min_total_iv: 37, max_total_iv: 45)
  AppraisalOverall.find_or_initialize_by(appraisal_class: 'OVERALL_STRONG').update_attributes!(min_total_iv: 30, max_total_iv: 36)
  AppraisalOverall.find_or_initialize_by(appraisal_class: 'OVERALL_DECENT').update_attributes!(min_total_iv: 23, max_total_iv: 29)
  AppraisalOverall.find_or_initialize_by(appraisal_class: 'OVERALL_POOR').update_attributes!(min_total_iv: 0, max_total_iv: 22)

  AppraisalBestStat.find_or_initialize_by(appraisal_class: 'BEST_STAT_AMAZING').update_attributes!(min_stat_iv: 15, max_stat_iv: 15)
  AppraisalBestStat.find_or_initialize_by(appraisal_class: 'BEST_STAT_STRONG').update_attributes!(min_stat_iv: 13, max_stat_iv: 14)
  AppraisalBestStat.find_or_initialize_by(appraisal_class: 'BEST_STAT_DECENT').update_attributes!(min_stat_iv: 8, max_stat_iv: 12)
  AppraisalBestStat.find_or_initialize_by(appraisal_class: 'BEST_STAT_POOR').update_attributes!(min_stat_iv: 0, max_stat_iv: 7)

  TeamLeaderAppraisalOverallPhrase.find_or_initialize_by(phrase: 'CANDELA_OVERALL_AMAZING').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'CANDELA').id, appraisal_overall_id: AppraisalOverall.find_by(appraisal_class: 'OVERALL_AMAZING').id)
  TeamLeaderAppraisalOverallPhrase.find_or_initialize_by(phrase: 'CANDELA_OVERALL_STRONG').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'CANDELA').id, appraisal_overall_id: AppraisalOverall.find_by(appraisal_class: 'OVERALL_STRONG').id)
  TeamLeaderAppraisalOverallPhrase.find_or_initialize_by(phrase: 'CANDELA_OVERALL_DECENT').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'CANDELA').id, appraisal_overall_id: AppraisalOverall.find_by(appraisal_class: 'OVERALL_DECENT').id)
  TeamLeaderAppraisalOverallPhrase.find_or_initialize_by(phrase: 'CANDELA_OVERALL_POOR').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'CANDELA').id, appraisal_overall_id: AppraisalOverall.find_by(appraisal_class: 'OVERALL_POOR').id)
  TeamLeaderAppraisalOverallPhrase.find_or_initialize_by(phrase: 'BLANCHE_OVERALL_AMAZING').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'BLANCHE').id, appraisal_overall_id: AppraisalOverall.find_by(appraisal_class: 'OVERALL_AMAZING').id)
  TeamLeaderAppraisalOverallPhrase.find_or_initialize_by(phrase: 'BLANCHE_OVERALL_STRONG').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'BLANCHE').id, appraisal_overall_id: AppraisalOverall.find_by(appraisal_class: 'OVERALL_STRONG').id)
  TeamLeaderAppraisalOverallPhrase.find_or_initialize_by(phrase: 'BLANCHE_OVERALL_DECENT').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'BLANCHE').id, appraisal_overall_id: AppraisalOverall.find_by(appraisal_class: 'OVERALL_DECENT').id)
  TeamLeaderAppraisalOverallPhrase.find_or_initialize_by(phrase: 'BLANCHE_OVERALL_POOR').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'BLANCHE').id, appraisal_overall_id: AppraisalOverall.find_by(appraisal_class: 'OVERALL_POOR').id)
  TeamLeaderAppraisalOverallPhrase.find_or_initialize_by(phrase: 'SPARK_OVERALL_AMAZING').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'SPARK').id, appraisal_overall_id: AppraisalOverall.find_by(appraisal_class: 'OVERALL_AMAZING').id)
  TeamLeaderAppraisalOverallPhrase.find_or_initialize_by(phrase: 'SPARK_OVERALL_STRONG').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'SPARK').id, appraisal_overall_id: AppraisalOverall.find_by(appraisal_class: 'OVERALL_STRONG').id)
  TeamLeaderAppraisalOverallPhrase.find_or_initialize_by(phrase: 'SPARK_OVERALL_DECENT').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'SPARK').id, appraisal_overall_id: AppraisalOverall.find_by(appraisal_class: 'OVERALL_DECENT').id)
  TeamLeaderAppraisalOverallPhrase.find_or_initialize_by(phrase: 'SPARK_OVERALL_POOR').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'SPARK').id, appraisal_overall_id: AppraisalOverall.find_by(appraisal_class: 'OVERALL_POOR').id)

  TeamLeaderAppraisalBestStatPhrase.find_or_initialize_by(phrase: 'CANDELA_BEST_STAT_AMAZING').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'CANDELA').id, appraisal_best_stat_id: AppraisalBestStat.find_by(appraisal_class: 'BEST_STAT_AMAZING').id)
  TeamLeaderAppraisalBestStatPhrase.find_or_initialize_by(phrase: 'CANDELA_BEST_STAT_STRONG').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'CANDELA').id, appraisal_best_stat_id: AppraisalBestStat.find_by(appraisal_class: 'BEST_STAT_STRONG').id)
  TeamLeaderAppraisalBestStatPhrase.find_or_initialize_by(phrase: 'CANDELA_BEST_STAT_DECENT').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'CANDELA').id, appraisal_best_stat_id: AppraisalBestStat.find_by(appraisal_class: 'BEST_STAT_DECENT').id)
  TeamLeaderAppraisalBestStatPhrase.find_or_initialize_by(phrase: 'CANDELA_BEST_STAT_POOR').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'CANDELA').id, appraisal_best_stat_id: AppraisalBestStat.find_by(appraisal_class: 'BEST_STAT_POOR').id)
  TeamLeaderAppraisalBestStatPhrase.find_or_initialize_by(phrase: 'BLANCHE_BEST_STAT_AMAZING').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'BLANCHE').id, appraisal_best_stat_id: AppraisalBestStat.find_by(appraisal_class: 'BEST_STAT_AMAZING').id)
  TeamLeaderAppraisalBestStatPhrase.find_or_initialize_by(phrase: 'BLANCHE_BEST_STAT_STRONG').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'BLANCHE').id, appraisal_best_stat_id: AppraisalBestStat.find_by(appraisal_class: 'BEST_STAT_STRONG').id)
  TeamLeaderAppraisalBestStatPhrase.find_or_initialize_by(phrase: 'BLANCHE_BEST_STAT_DECENT').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'BLANCHE').id, appraisal_best_stat_id: AppraisalBestStat.find_by(appraisal_class: 'BEST_STAT_DECENT').id)
  TeamLeaderAppraisalBestStatPhrase.find_or_initialize_by(phrase: 'BLANCHE_BEST_STAT_POOR').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'BLANCHE').id, appraisal_best_stat_id: AppraisalBestStat.find_by(appraisal_class: 'BEST_STAT_POOR').id)
  TeamLeaderAppraisalBestStatPhrase.find_or_initialize_by(phrase: 'SPARK_BEST_STAT_AMAZING').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'SPARK').id, appraisal_best_stat_id: AppraisalBestStat.find_by(appraisal_class: 'BEST_STAT_AMAZING').id)
  TeamLeaderAppraisalBestStatPhrase.find_or_initialize_by(phrase: 'SPARK_BEST_STAT_STRONG').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'SPARK').id, appraisal_best_stat_id: AppraisalBestStat.find_by(appraisal_class: 'BEST_STAT_STRONG').id)
  TeamLeaderAppraisalBestStatPhrase.find_or_initialize_by(phrase: 'SPARK_BEST_STAT_DECENT').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'SPARK').id, appraisal_best_stat_id: AppraisalBestStat.find_by(appraisal_class: 'BEST_STAT_DECENT').id)
  TeamLeaderAppraisalBestStatPhrase.find_or_initialize_by(phrase: 'SPARK_BEST_STAT_POOR').update_attributes!(team_leader_id: TeamLeader.find_by(name: 'SPARK').id, appraisal_best_stat_id: AppraisalBestStat.find_by(appraisal_class: 'BEST_STAT_POOR').id)