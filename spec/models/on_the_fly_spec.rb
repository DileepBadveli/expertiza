describe OnTheFlyCalc do
 let(:assignment) { build(:assignment, id: 1, assignment_questionaire: assignment_questionnaire, questionaire: questionaire)}
 let(:assignment_questionnaire) { build(:assignment_questionnaire, used_in_round: 2)}
 let(:assignment2) { build(:assignment, id: 2, assignment_questionaire: assignment_questionnaire2)}
 let(:assignment_questionnaire2) { build(:assignment_questionnaire, used_in_round: 1)
 let(:questionnaire) { build(:questionnaire)}
 describe '#compute_total_score' do
 it 'return total scores' do
   @score={"1"=>{:scores=>{:avg=>4.5}}}
   allow(Questionnaire).to receive(:get_weighted_score).with(assignment,@score).and_return(4.5)
   expect(questionnaire.get_weighted_score(assignment,@score)).to eq(4.5)
 end
 end
 describe '#compute_reviews_hash' do
  it 'for varying_rubrics_by_round case' do
    allow(Assignment).to receive(:varying_rubrics_by_round?).and_return(true)
    expect(assignment.varying_rubrics_by_round?).to eq(true)
  end
  it 'for non-varying_rubrics_by_round case' do
    allow(Assignment).to receive(:varying_rubrics_by_round?).and_return(false)
    expect(assignment2.varying_rubrics_by_round?).to eq(false)
  end
 end
 describe '#compute_avg_and_ranges_hash' do

 end
 describe '#scores' do

 end
end
