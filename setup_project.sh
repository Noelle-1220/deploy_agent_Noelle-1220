#/bin/bash
# setup_project.sh the student tracker project codes begins
# 1. Codes to prompt user to insert directory name for the versioned parent directory

read -p "Enter project/directory name: " input
project_dir="attendance_tracker_$input"

# 2. code that Signal Trap to archive and purge if interrupted (Ctrl+C/ SIGINT) 

# explanation for -czf : -c stands for create,-z stands for Gzip to compress file, -f tells the system the next word typed is the name of the file.

cleanup() {
    echo -e "\nSetup interrupted. Archiving current progress..."
    tar -czf "${project_dir}_archive.tar.gz" "$project_dir" 2>/dev/null
    rm -rf "$project_dir"
    exit 1
}
trap cleanup SIGINT

# 3. codes that will Build the required directory structure.

mkdir -p "$project_dir/Helpers" "$project_dir/reports"

# 4.codes to move pulled source  files into their respective subdirectories as shown by the directory  structure tree.

# This codes function well if  files are in the same folder as the script

mv attendance_checker.py "$project_dir/"
mv assets.csv "$project_dir/Helpers/"
mv config.json "$project_dir/Helpers/"
mv reports.log "$project_dir/reports/" 2>/dev/null || touch "$project_dir/reports/reports.log"

# 5. the code that enter the project directory to perform configuration

cd "$project_dir"

# 6. codes used to Perform Dynamic Configuration using Stream Editing (sed)

read -p "Update thresholds? (y/n): " choice
if [[ "$choice" == "y" ]]; then
    read -p "Enter New Warning Value: " new_warning_val
    read -p "Enter New Failure value: " new_failure_val

    # Used 'sed'to perfom  In-place edit of the config.json file using substitution

    sed -i "s/75/$new_warning_val/" Helpers/config.json
    sed -i "s/50/$new_failure_val/" Helpers/config.json
    
    echo "Configuration updated successfully."

else

    echo "Maintaining default threshold values (75/50)."

fi

# 7.  Verifying  Python installation and structure.

if python3 --version > /dev/null 2>&1; then

    echo "✔ python3  is installed."

else
    echo "⚠ Warning: Python3 is not installed on this system."

fi
