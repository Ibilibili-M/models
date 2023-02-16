. ./hole_path_config_mobilev3.sh

set -e

export CUDA_VISIBLE_DEVICES=3

TRAIN_STEPS=300000

# 训练模型
python train.py \
    --logtostderr \
    --num_clones=1 \
    --train_batch_size=8 \
    --fine_tune_batch_norm=false \
    --training_number_of_steps=${TRAIN_STEPS} \
    --base_learning_rate=0.0004 \
    --train_split="train" \
    --model_variant="mobilenet_v3_large_seg" \
    --train_crop_size=1024,1024 \
    --image_pooling_stride=4,5 \
    --add_image_level_feature=1 \
    --aspp_convs_filters=128 \
    --aspp_with_concat_projection=0 \
    --aspp_with_squeeze_and_excitation=1 \
    --decoder_use_sum_merge=1 \
    --decoder_filters=2 \
    --decoder_output_is_logits=1 \
    --image_se_uses_qsigmoid=1 \
    --decoder_output_stride=8 \
    --output_stride=32 \
    --dataset="hole" \
    --tf_initial_checkpoint=${PATH_TO_INITIAL_CHECKPOINT} \
    --train_logdir=${PATH_TO_TRAIN_DIR} \
    --dataset_dir=${PATH_TO_DATASET}



# # 导出模型
python export_model.py \
    --logtostderr \
    --checkpoint_path="${PATH_TO_TRAIN_DIR}/model.ckpt-${TRAIN_STEPS}" \
    --export_path="${EXPORT_DIR}/${DATA_VERSION}_${EXP_NAME}.pb" \
    --model_variant="mobilenet_v3_large_seg" \
    --output_stride=32 \
    --decoder_output_stride=8 \
    --num_classes=2 \
    --crop_size=1024 \
    --crop_size=1024 \
    --inference_scales=1.0
# checkpoint_path：训练保存的检查点文件
# export_path：模型导出路径
# num_classes：分类类别
# crop_size：图像尺寸，默认为[513, 513]，可以修改大小，这个影响测试图像输出的图像尺寸。但是尺寸过大时导出模型可能会报错，好像和显存大小有关，而且尺寸越大的话，测试图像需要的时间会越长。
# atrous_rates和output_stride可以和训练的时候不一样。我的配置是一样的。
# inference_scales：多尺度推理，默认[1.0]。更改为 [0.5, 0.75, 1.0, 1.25, 1.5, 1.75] 进行多尺度推理。
