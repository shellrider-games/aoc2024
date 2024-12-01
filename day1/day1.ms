import "ListUtil"
import "MapUtil"

fileName = "day1\input.txt"
lines = file.readLines(fileName)

left = []
right = []

for line in lines
    splitLine = line.split("   ")
    left.push splitLine[0].val
    right.push splitLine[1].val
end for

left.sort
right.sort

distance = 0

for i in range(0 , left.len-1)
    distance = distance + abs(left[i] - right[i])
end for

print "Distance: " + distance

countMap = right.counts
similarity = 0

for value in left
    similarity = similarity + value * countMap.get(value, 0)
end for

print "Similarity: " + similarity