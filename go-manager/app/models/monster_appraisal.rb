class MonsterAppraisal < ApplicationRecord

  # every MonsterAppraisal is linked to a Monster, through monster_id
  belongs_to :monster

  # every MonsterAppraisal is linked to an AppraisalOverallPhrase, through appraisal_overall_phrase_id
  belongs_to :appraisal_overall_phrase

  # every MonsterAppraisal is linked to a AppraisalIndividualPhrase, through appraisal_individual_phrase_id
  belongs_to :appraisal_individual_phrase

end
