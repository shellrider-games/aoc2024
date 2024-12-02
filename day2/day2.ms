fileName = "day2\input.txt"

isSafe = function(report)
    valA = report[0]
    valB = report[1]
    increasing = valA < valB
    for i in range(1,report.len-1)
        difference = report[i] - report[i-1]
        if abs(difference) > 3 then return false
        if increasing and difference <= 0 then return false
        if not increasing and difference >= 0 then return false
    end for
    return true
end function

reports = []

for line in file.readLines(fileName)
    if not line then continue
    splitLine = line.split
    report = []
    for entry in splitLine
        report.push entry.val
    end for
    reports.push report
end for

safeCounter = 0

for report in reports
    if isSafe(report) then safeCounter += 1
end for

print "Number of safe reports: " + safeCounter