local rows,col=5,5
local alarm_kpi={}

for i=1,rows do
  alarm_kpi[i]={}  -- Initialize each row as a table  
  for j=1,col do
     alarm_kpi[i][j]=math.random(1,100)
  end

end

-- Function to print the matrix
for i=1,rows do

  for j=1,col do
     io.write(string.format("row=%d,col=%d, value=%d\t",i,j,alarm_kpi[i][j]))
  end
    io.write("\n")  -- New line after each row for better readability
end
print("Transpose of the matrix:")
-- transpose
for i=1,col do

  for j=1,rows do
     io.write(string.format("col=%d,row=%d, value=%d\t",i,j,alarm_kpi[j][i]))
  end
    io.write("\n")  -- New line after each row for better readability
end