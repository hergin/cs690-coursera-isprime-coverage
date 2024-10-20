#!/bin/bash

cd /home/coder/project/autograde/
git clone https://github.com/hergin/cs690-coursera-isprime-coverage

cp /shared/submission/PrimeService_IsPrimeShould.cs /home/coder/project/autograde/cs690-coursera-isprime-coverage/full/PrimeService.Tests/PrimeService_IsPrimeShould.cs
cd /home/coder/project/autograde/cs690-coursera-isprime-coverage/full

test_result="$(dotnet test /p:CollectCoverage=true /p:Threshold=80)"

if [[ $test_result =~ "The minimum line coverage is below the specified 80" ]]; then
    echo "{ \"fractionalScore\": 0.0, \"feedback\":\"\", \"feedbackType\": \"HTML\" }" > /shared/feedback.json
    echo "<b>Coverage not reached and here is the result of command:</b><br/><br/>"$test_result > /shared/htmlFeedback.html
else
    echo "{ \"fractionalScore\": 1.0, \"feedback\":\"\", \"feedbackType\": \"HTML\" }" > /shared/feedback.json
    echo "<b>Coverage reached!</b>" > /shared/htmlFeedback.html
fi
exit 0