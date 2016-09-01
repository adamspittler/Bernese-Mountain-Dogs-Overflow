module VoteTotal
  def total_votes
    sum= 0
    self.votes.each do |vote|
      sum += vote.value
    end
    sum
  end
end

helpers VoteTotal
