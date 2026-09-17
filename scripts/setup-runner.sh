# Install build tools
sudo apt install build-essential software-properties-common
sudo apt install clang-14
sudo apt install cmake cmake-gui
sudo apt install ninja-build
sudo apt install ccache

# Install dependencies
sudo apt install libtinyxml2-dev
sudo apt install libopengl0
sudo apt install libboost-all-dev
python -m pip install numpy scipy pybind11==2.12.0
sudo apt install libpng-dev libjpeg-dev libtiff-dev libglew-dev zlib1g-dev
sudo apt install libeigen3-dev

sudo apt install xorg-dev libgtk-3-dev
