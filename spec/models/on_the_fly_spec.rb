describe OnTheFlyCalc do
 let(:assignment) { build(:assignment, id: 1,)}
 let(:Assignment){ Assignment.new}
 Assignment.extend(OnTheFlyCalc)
 describe '#compute_total_score' do
 it 'return total scores' do
   @score={"1"=>{:scores=>{:avg=>4.5}}}
   allow(Questionnaire).to receive(:get_weighted_score).with(assignment,@score).and_return(4.5)
   expect(Questionnaire.get_weighted_score(assignment,@score)).to eq(4.5)
 end
 end
 describe '#compute_reviews_hash' do
   context "Has multiple review phases with different review rubrics" do
     it "calls scores_varying_rubrics" do
       allow(Assignment).to receive(:varying_rubrics_by_round?).and_return(true)
       Assignment.compute_reviews_hash
       expect(Assignment).to receive(:scores_varying_rubrics)
     end
   end
   context "Does not have multiple review phases with different review rubrics" do
     it "calls scores_non_varying_rubrics" do
       allow(Assignment).to receive(:varying_rubrics_by_round?).and_return(false)
       Assignment.compute_reviews_hash
       expect(Assignment).to receive(:scores_non_varying_rubrics)
     end
   end

 end
 describe '#compute_avg_and_ranges_hash' do

 end
 describe '#scores' do

 end
end
