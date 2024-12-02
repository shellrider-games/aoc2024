fileName = "day2\example_input.txt"

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

isSafeWithDampening = function(report)
    if isSafe(report) then return true
    if isSafe(report[1:]) then return true
    if isSafe(report[:-1]) then return true
    for i in range(1, report.len-2)
        dampenedReport = report[0:i] + report[i+1:]
        if isSafe(dampenedReport) then return true
    end for
    return false
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
dampendedSafeCounter = 0
for report in reports
    if isSafe(report) then safeCounter += 1
    if isSafeWithDampening(report) then dampendedSafeCounter += 1
end for

print "Number of safe reports: " + safeCounter
print "Number of safe reports with dampending: " + dampendedSafeCounter