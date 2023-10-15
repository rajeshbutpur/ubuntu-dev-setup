#!/bin/bash

# Change directory to a folder within $HOME
# shellcheck disable=SC2164
cd "$HOME/mywork"

# Array of repository URLs
repos=(
    "https://github.com/<user_name>/<project_name>"
    "git@github.com:<user_name>/<project_name>.git"
    # Add more repositories if needed
)

# Function to clone repositories and set up virtual environment
clone_repositories() {
    for repo_url in "${repos[@]}"
    do
        # Extract the repository name from the URL
        repo_name=$(basename "$repo_url" .git)
        echo "$repo_url"

        # Check if the repository directory already exists
        if [ -d "$repo_name" ]; then
            echo "Repository $repo_name already exists. Skipping clone."
        else
            # Clone the repository
            git clone "$repo_url" "$repo_name"

            # Navigate to the cloned repository
            cd "$repo_name"

            # Check if requirements.txt exists
            if [ -d "requirements" ]; then
                # Set up a Python virtual environment
                python3 -m venv venv

                # Activate the virtual environment
                source venv/bin/activate

                # Install requirements
                pip install -r requirements/local.txt

                # Deactivate the virtual environment
                deactivate

                echo "Python virtual environment created and requirements installed for $repo_name."
            else
                echo "No requirements.txt found for $repo_name."
            fi

            # Return to the original directory
            cd ..
        fi
    done
}

# Call the function to clone repositories and set up virtual environments
clone_repositories

# echo "Repositories cloned and Python virtual environments set up successfully."