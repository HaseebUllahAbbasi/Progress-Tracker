#!/bin/bash

# Function to check if a submodule has already been cloned
function is_submodule_cloned() {
    local submodule_path="$1"
    if [ -d "$submodule_path" ]; then
        return 0  # Submodule already cloned
    else
        return 1  # Submodule not cloned
    fi
}

# Clone the child repositories
if ! is_submodule_cloned "backend-progress-tracker"; then
    git clone git@github.com:HaseebUllahAbbasi/backend-progress-tracker.git
fi

if ! is_submodule_cloned "web-progress-tracker"; then
    git clone git@github.com:HaseebUllahAbbasi/web-progress-tracker.git
fi

if ! is_submodule_cloned "app-progress-tracker"; then
    git clone git@github.com:HaseebUllahAbbasi/app-progress-tracker.git
fi

if ! is_submodule_cloned "desktop-progress-tracker"; then
    git clone git@github.com:HaseebUllahAbbasi/desktop-progress-tracker.git
fi

# Update and checkout to the development branches
git submodule update --init --recursive
git submodule foreach --recursive git checkout development
git submodule foreach --recursive git pull

# Install dependencies using yarn
cd backend-progress-tracker
yarn

cd ../web-progress-tracker
yarn

cd ../app-progress-tracker
yarn

# Additional steps or commands as per your requirement
