#!/bin/bash
#SBATCH --job-name=dt
#SBATCH --output=logs/matching_obj.out
#SBATCH --cpus-per-task=8
#SBATCH --mem=32000
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tianrunhu@gmail.com
#SBATCH --gres=gpu:1
#SBATCH --nodelist=crane0

# Display GPU information
nvidia-smi

# Activate the conda environment
source /data/home/tianrun/anaconda3/etc/profile.d/conda.sh
conda activate pgsr

# Set the specific task paths
task_name="matching_obj"
data_path="/data/home/share/rls_recon/pgsr_data/${task_name}"
out_path="output/${task_name}"

# Run the training script with specified arguments
python train.py -s "$data_path" -m "$out_path" --max_abs_split_points 0 --opacity_cull_threshold 0.01