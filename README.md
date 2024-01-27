# AUTO UPDATE

# Download the update script
curl -O https://raw.githubusercontent.com/DCZLLC/CLAUTOUPDATE/main/runupdate.sh

# Make the script executable
chmod +x runupdate.sh

# IMPORTANT: Make sure to stop the old Cryptoluck daemon before proceeding.

# Run the update script
./runupdate.sh
