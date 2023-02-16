ROOT="/home/lifei/models/research/deeplab/datasets/"
DATA_VERSION="data_hole"
EXP_NAME="hole-0103-lr00004-mobilenetv3"

# PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/deeplabv3_pascal_train_aug/model.ckpt"
# PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/data_v11-v2/exp-1013/train/model.ckpt-800000"
PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/deeplab_mnv3_large_cityscapes_trainfine/model.ckpt"
# PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/deeplabv3_xception_ade20k_train/model.ckpt"
PATH_TO_DATASET="${ROOT}/${DATA_VERSION}/tfrecord"

PATH_TO_TRAIN_DIR="${ROOT}/${DATA_VERSION}/${EXP_NAME}/train"
PATH_TO_EVAL_DIR="${ROOT}/${DATA_VERSION}/eval/${EXP_NAME}"
PATH_TO_VIS_DIR="${ROOT}/${DATA_VERSION}/${EXP_NAME}/vis"
EXPORT_DIR="${ROOT}/${DATA_VERSION}/${EXP_NAME}/export"
