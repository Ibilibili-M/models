. ./wheel_path_config_xception_71.sh
export CUDA_VISIBLE_DEVICES=2

python eval.py \
    --logtostderr \
    --eval_split="val" \
    --model_variant="xception_71" \
    --atrous_rates=6 \
    --atrous_rates=12 \
    --atrous_rates=18 \
    --output_stride=16 \
    --decoder_output_stride=4 \
    --eval_crop_size="513,513" \
    --dataset="wheel" \
    --checkpoint_dir=${PATH_TO_TRAIN_DIR} \
    --eval_logdir=${PATH_TO_EVAL_DIR} \
    --dataset_dir=${PATH_TO_DATASET}