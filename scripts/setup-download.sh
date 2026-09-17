# Directory structure:
# - src : SOFA source
# - plugins : plugins source with a CMakeLists file 
# - python : Python build standalone from Astral (https://github.com/astral-sh/python-build-standalone/)

# clone the sofa repository into src
git clone git@github.com:sofa-framework/sofa.git src

# clone plugins into plugins directory
git clone git@github.com:SofaComplianceRobotics/SofaPython3.git plugins/SofaPython3
git clone git@github.com:sofa-framework/BeamAdapter.git plugins/BeamAdapter
git clone --single-branch --branch robotics git@github.com:SofaComplianceRobotics/SofaGLFW.git plugins/SofaGLFW
git clone git@github.com:SofaDefrost/SoftRobots.git plugins/SoftRobots
git clone git@github.com:SofaDefrost/SoftRobots.Inverse.git plugins/SoftRobots.Inverse
git clone git@github.com:SofaDefrost/Cosserat.git plugins/Cosserat
git clone git@github.com:SofaDefrost/STLIB.git plugins/STLIB

# if plugins/CMakeLists.txt exists, remove it
if [ -f plugins/CMakeLists.txt ]; then
    rm plugins/CMakeLists.txt
fi

touch plugins/CMakeLists.txt
echo "cmake_minimum_required(VERSION 3.12)
sofa_add_subdirectory(plugin SofaPython3 SofaPython3 ON)
sofa_add_subdirectory(plugin STLIB STLIB ON)
sofa_add_subdirectory(plugin BeamAdapter BeamAdapter ON)
sofa_add_subdirectory(plugin Cosserat Cosserat ON)
sofa_add_subdirectory(plugin SoftRobots SoftRobots ON)
sofa_add_subdirectory(plugin SoftRobots.Inverse SoftRobots.Inverse ON)
sofa_add_subdirectory(plugin SofaGLFW SofaGLFW ON)" >> plugins/CMakeLists.txt

# Download Python
# For Linux
curl -L -o cpython.tar.gz https://github.com/astral-sh/python-build-standalone/releases/download/20260901/cpython-3.14.7+20260901-x86_64-unknown-linux-gnu-install_only.tar.gz
tar -xvf cpython.tar.gz

# For Windows

# For MacOS