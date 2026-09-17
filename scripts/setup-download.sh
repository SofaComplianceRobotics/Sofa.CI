# Directory structure:
# - src : SOFA source
# - plugins : plugins source with a CMakeLists file 
# - python : Python build standalone from Astral (https://github.com/astral-sh/python-build-standalone/)

# Clone sofa repository into src and use Compliance Robotics postinstall-fixup
git clone https://github.com/sofa-framework/sofa.git src
git clone https://github.com/SofaComplianceRobotics/Sofa.CI.Tools.git tools
rm -r src/tools/postinstall-fixup
mv tools/postinstall-fixup src/tools/postinstall-fixup

# Clone plugins into the plugins directory
git clone --single-branch --branch pr_bundlepython https://github.com/SofaComplianceRobotics/SofaPython3.git plugins/SofaPython3
git clone https://github.com/sofa-framework/BeamAdapter.git plugins/BeamAdapter
git clone --single-branch --branch robotics https://github.com/SofaComplianceRobotics/SofaGLFW.git plugins/SofaGLFW
git clone https://github.com/SofaDefrost/SoftRobots.git plugins/SoftRobots
git clone https://github.com/SofaDefrost/SoftRobots.Inverse.git plugins/SoftRobots.Inverse
git clone https://github.com/SofaDefrost/Cosserat.git plugins/Cosserat
git clone https://github.com/SofaDefrost/STLIB.git plugins/STLIB

# Create CMakelists for the plugins
# If plugins/CMakeLists.txt exists, remove it
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
tar -xf cpython.tar.gz

# For Windows

# For MacOS

echo "################################################"
echo "# Working Directory:"
ls 
echo "# Plugins Directory:"
ls plugins
echo "################################################"
