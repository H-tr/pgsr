#!/bin/bash
#SBATCH --job-name=recon
#SBATCH --output=logs/render.out
#SBATCH --cpus-per-task=32
#SBATCH --mem=128000
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tianrunhu@gmail.com
#SBATCH --gres=gpu:1
#SBATCH --nodelist=crane0

# Display GPU information
nvidia-smi

# Activate the conda environment
source /data/home/tianrun/anaconda3/etc/profile.d/conda.sh
conda activate pgsr

# Base output path
output_base="output"

# Loop through each subfolder in the output directory
# for folder in "$output_base"/*; do
#     # Ensure only directories are processed
#     if [ -d "$folder" ]; then
#         # Define out_path for each subfolder
#         out_path="$folder"
        
#         # Run the render script for each subfolder
#         python render.py -m "$out_path" --max_depth 10.0 --voxel_size 0.01
#     fi
# done

# python render.py -m output/matching_obj --max_depth 5.0 --voxel_size 0.01
python render.py -m output/matching_obj --max_depth 2.0 --voxel_size 0.005