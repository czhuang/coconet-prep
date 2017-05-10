#!/bin/bash

# Assumes that this script is run from within the Coconet root directory.  Change the following line if this is not the case.
code_dir=$(dirname $0)
# Change this to dir for saving experiment logs. 
log_dir="$code_dir/logs"
# Change this to where data is loaded from.
data_dir="$code_dir/data"
dataset=jsb-chorales-16th-withvoicing

# Data preprocessing.
crop_piece_len=64
separate_instruments=True
quantization_level=0.125  # 16th notes

# Hyperparameters.
maskout_method=balanced_by_scaling
num_layers=64
num_filters=128

# Run command.
python "$code_dir"/basic_autofill_cnn_train.py \
--log_dir $log_dir \
--log_process True \
--data_dir $data_dir \
--dataset $dataset \
--crop_piece_len $crop_piece_len \
--separate_instruments $separate_instruments \
--quantization_level $quantization \
--maskout_method $maskout_method \
--model_name DeepStraightConvSpecs \
--num_layers $num_layers \
--num_filters $num_filters \
--use_residual 1 \
--batch_size 20 \
--mask_indicates_context True \
--optimize_mask_only False \
--rescale_loss True \
--patience 5 \
--augment_by_transposing 0 \
--augment_by_halfing_doubling_durations 0 \
--denoise_mode False \
--num_epochs 0 \
--save_model_secs 30 \
--use_pop_stats True \
--pad True \
--maskout_method balanced_by_scaling \
--eval_freq 5 \
