#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 12:00:00
#SBATCH -J Assembly_Test_1_Apr1
#SBATCH --mail-type=ALL
#SBATCH --mail-user erikspencereverett@gmail.com
# Load modules
module load bioinfo-tools
module load canu
# Your commands
canu -p assembled_L.ferri_1_4 -d /home/erikpa/Genome_Analysis_Project_2022/Data/ genomeSize=2.41m useGrid=false -pacbio /home/erikpa/Genome_Analysis_Project_2022/Data/DNA_raw_data/* 

