#!/bin/sh

sudo pacman -S --noconfirm wget

mkdir ~/matlab/
cd ~/matlab/

wget -P ~/matlab/ https://www.mathworks.com/mpm/glnxa64/mpm

chmod 777 mpm

./mpm install --release=R2021b --destination=/home/$USER/matlab MATLAB Simulink Deep_Learning_Toolbox Parallel_Computing_Toolbox

sh ~/matlab/bin/matlab
