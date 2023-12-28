#!/bin/bash

# 1. El comando hostname
echo "1. Comando hostname:"
echo "   En ibsen:"
hostname
echo "   En el contenedor my-python.sif de Singularity:"
singularity exec my-python.sif hostname 
echo ""

# 2. El comando cat /etc/os-release
echo "2. Comando cat /etc/os-release:"
echo "   En ibsen:"
cat /etc/os-release
echo "   En el contenedor my-python.sif de Singularity:"
singularity exec my-python.sif cat /etc/os-release
echo ""

# 3. El comando pwd
echo "3. Comando pwd:"
echo "   En ibsen:"
pwd
echo "   En el contenedor my-python.sif de Singularity:"
singularity exec my-python.sif pwd
echo ""

# 4. El comando ls -l /home
echo "4. Comando ls -l /home:"
echo "   En ibsen:"
ls -l /home
echo "   En el contenedor my-python.sif de Singularity:"
singularity exec my-python.sif ls -l /home 
echo ""

# 5. El comando python --version
echo "5. Comando python --version:"
echo "   En ibsen:"
python --version
echo "   En el contenedor my-python.sif de Singularity:"
singularity exec my-python.sif python --version 
echo ""

# 6. Ejecutar el notebook pi.ipynb en el directorio source y en el contenedor
echo "6. Ejecutar el notebook pi.ipynb en el directorio source y en el contenedor:"
echo "   En ibsen:"
module load anaconda/2023.03
ipython /home/alumno15/Lab6-Singularity/Source/pi-exercise-submit.ipynb 100000 
echo "   En el contenedor my-python.sif de Singularity:"
singularity exec my-python.sif ipython /app/pi-exercise-submit.ipynb 100000
echo ""

echo "Proceso completado."
