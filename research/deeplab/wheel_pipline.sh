export CUDA_VISIBLE_DEVICES=0,1,2,3

PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/deeplabv3_pascal_train_aug/model.ckpt"
PATH_TO_TRAIN_DIR="/home/lifei/models/research/deeplab/datasets/data_v2/exp-0610/train"
PATH_TO_DATASET="/home/lifei/models/research/deeplab/datasets/data_v2/tfrecord"

# 训练模型
python train.py \
    --logtostderr \
    --num_clones=4 \
    --train_batch_size=8 \
    --fine_tune_batch_norm=False \
    --training_number_of_steps=800000 \
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


# From tensorflow/models/research/
export CUDA_VISIBLE_DEVICES=0
# PATH_TO_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/data_v1/exp-0610/train/model.ckpt-800000"
PATH_TO_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/data_v1/exp-0610/train"
PATH_TO_EVAL_DIR="/home/lifei/models/research/deeplab/datasets/data_v1/exp-0610/eval"
PATH_TO_DATASET="/home/lifei/models/research/deeplab/datasets/data_v1/tfrecord"
python eval.py \
    --logtostderr \
    --eval_split="val" \
    --model_variant="xception_65" \
    --atrous_rates=6 \
    --atrous_rates=12 \
    --atrous_rates=18 \
    --output_stride=16 \
    --decoder_output_stride=4 \
    --eval_crop_size="513,513" \
    --dataset="wheel" \
    --checkpoint_dir=${PATH_TO_CHECKPOINT} \
    --eval_logdir=${PATH_TO_EVAL_DIR} \
    --dataset_dir=${PATH_TO_DATASET}


# 导出模型
python export_model.py \
    --logtostderr \
    --checkpoint_path="/home/lifei/models/research/deeplab/datasets/data_v2/exp-0610/train/model.ckpt-800000" \
    --export_path="/home/lifei/models/research/deeplab/output/datav2_0623.pb" \
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
