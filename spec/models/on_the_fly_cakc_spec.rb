let(:assignment) { build(:assignment, id: 1,)}

describe '#compute_total_score' do
it 'return total scores' do
  @score={"1": {scores: {avg: 4.5}}}
  allow(Questionnaire).to receive(:get_weighted_score).with(assignment,@score).and_return(4.5)
end
end
describe '#compute_reviews_hash' do
  it

end
describe '#compute_avg_and_ranges_hash' do

end
describle '#scores' do

end