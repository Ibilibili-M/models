. ./wheel_path_config.sh

set -e

export CUDA_VISIBLE_DEVICES=0,1,2,3

TRAIN_STEPS=500000

# 训练模型
python train.py \
    --logtostderr \
    --num_clones=4 \
    --train_batch_size=8 \
    --fine_tune_batch_norm=false \
    --training_number_of_steps=${TRAIN_STEPS} \
    --base_learning_rate 0.0004 \
    --train_split="train" \
    --model_variant="xception_65" \
    --atrous_rates=6 \
    --atrous_rates=12 \
    --atrous_rates=18 \
    --output_stride=16 \
    --decoder_output_stride=4 \
    --train_crop_size="513,513" \
    --dataset="wheel" \
    --tf_initial_checkpoint=${PATH_TO_INITIAL_CHECKPOINT} \
    --train_logdir=${PATH_TO_TRAIN_DIR} \
    --dataset_dir=${PATH_TO_DATASET}

# # 导出模型
python export_model.py \
    --logtostderr \
    --checkpoint_path="${PATH_TO_TRAIN_DIR}/model.ckpt-${TRAIN_STEPS}" \
    --export_path="${EXPORT_DIR}/datav3_${EXP_NAME}.pb" \
    --model_variant="xception_65" \
    --atrous_rates=6 \
    --atrous_rates=12 \
    --atrous_rates=18 \
    --output_stride=16 \
    --decoder_output_stride=4 \
    --num_classes=13 \
    --crop_size=513 \
    --crop_size=513 \
    --inference_scales=1.0
# checkpoint_path：训练保存的检查点文件
# export_path：模型导出路径
# num_classes：分类类别
# crop_size：图像尺寸，默认为[513, 513]，可以修改大小，这个影响测试图像输出的图像尺寸。但是尺寸过大时导出模型可能会报错，好像和显存大小有关，而且尺寸越大的话，测试图像需要的时间会越长。
# atrous_rates和output_stride可以和训练的时候不一样。我的配置是一样的。
# inference_scales：多尺度推理，默认[1.0]。更改为 [0.5, 0.75, 1.0, 1.25, 1.5, 1.75] 进行多尺度推理。
