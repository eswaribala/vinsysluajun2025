
local result=io.popen("ping -n 1 google.com","r")
if not result then
    print("Error: Could not execute command.")
else
    local output = result:read("*all")
    result:close()
    if not output or output == "" then
        print("No output from command.")
    else
        print("Command executed successfully. Output:")
        -- Print the output of the command
        for line in output:gmatch("[^\n]+") do
            print(line)
        end
    end
end
-- create directory

os.execute("mkdir testdir")
-- change directory
os.execute("cd testdir")
-- create file in directory
os.execute("echo Hello World > testdir\\hello.txt")