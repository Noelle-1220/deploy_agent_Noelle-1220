This is the file that contained some guidance of what the Repository deploy-agent-Noelle-1220 ( which is a summative task 'Attendance Tracker: Project Factory') .

 # How to Run the codes

1.Execute the script by typing : './name-of-the-shell-command' which is setup-project.sh. 

 # Automated Features

 **Directory Architecture**: Automatically builds the required 'Helpers/' and 'reports/' folder structure.

 **Source files Movement**: Safely moves source files into their correct subdirectories, with a fallback mechanism to ensure logs are present.

 **Dynamic Configuration**: Uses 'sed' to programmatically update attendance thresholds within 'config.json' based on user input.

 **Process Management**: Includes a Signal Trap ('SIGINT') that archives the project state and purges incomplete directories if the process is interrupted.

 # Project Walkthrough

You can view the full project presentation and logic walkthrough here:

https://www.loom.com/share/924c97eacba34443ae11c36e58aac15a
