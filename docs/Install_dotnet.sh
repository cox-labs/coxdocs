#/bin/bash

#check that the installation path is provided as an argument
if [ -z "$1" ]
then
    echo "Please provide the installation path as an argument"
    return 1
fi

# Remove trailing slash if it exists
DOTNET_PATH=$(echo $1 | sed 's:/*$::')

wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh --version 8.0.302  --install-dir $DOTNET_PATH/dotnet8/

# Check if the path already exists in .bashrc before adding it
if ! grep -q "${DOTNET_PATH}/dotnet8" ~/.bashrc
then
    echo "PATH=${DOTNET_PATH}/dotnet8:$PATH" >> ~/.bashrc
fi

source ~/.bashrc