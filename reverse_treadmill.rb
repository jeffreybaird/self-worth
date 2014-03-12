#!/usr/bin/env ruby -w
require 'date'

messages = [
  'My kid\'s appointment at the pediatrician can wait, I need to get this commit in.',
  'Sorry honey, I need to keep my streak going - we\'ll have sex tomorrow!'
]

rr = %w{ Never gonna give you up Never gonna let you down Never gonna run around and desert you Never gonna make you cry Never gonna say goodbye Never gonna tell a lie and hurt you\n }

gh_founding = DateTime.new(2008,7,21)

i = 0
gh_founding.to_date.step(Date.today) do |day|
  File.open('self_worth', 'a') { |f| f.write(rr[i % 34]) }
  File.open('msg', 'w') { |f| f.write(messages.sample) }
  system({'GIT_COMMITTER_DATE' => day.rfc2822, 'GIT_AUTHOR_DATE' => day.rfc2822}, "git commit -q -F msg -- self_worth")
end

