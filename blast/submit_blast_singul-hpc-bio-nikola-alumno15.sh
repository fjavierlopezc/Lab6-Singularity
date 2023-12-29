#!/bin/bash
#
#SBATCH -p hpc-bio-nikola-cpu
#SBATCH --chdir=/home/alumno15/Lab6-advanced-dir
#SBATCH -J submit_blast_singul-hpc-bio-nikola-alumno15.sh
#SBATCH --cpus-per-task=1
#SBATCH --tasks-per-node=1
#SBATCH --output=results-blast.txt
#SBATCH --mail-type=NONE    #END/START/NONE
#SBATCH --mail-user=MAIL@um.es

# Cargar el módulo de Singularity
module load singularity

# Ejecutamos la imagen de blast por medio de bash en singularity 
singularity exec /nas/hdd-0/singularity_images/blast_2.9.0--pl526h3066fca_4.sif bash -c '

   # Usamos gzip para descomprimir la base de datos 
    gzip -d zebrafish.1.protein.faa.gz 
    #Preparar la base de datos con makeblastdb en la imagen de Singularity
    makeblastdb -in zebrafish.1.protein.faa -dbtype prot
    # Ejecución de blast y guardamos su salida en el fichero results-blast-txt
    blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results-blast.txt
'
