ROOT="/home/lifei/models/research/deeplab/datasets/"
DATA_VERSION="data_hole-20230214"
EXP_NAME="hole-0215-lr00004_ms"

# PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/deeplabv3_pascal_train_aug/model.ckpt"
# PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/data_v11-v2/exp-1013/train/model.ckpt-800000"
# PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/deeplab_mnv3_large_cityscapes_trainfine/model.ckpt"
PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/data_hole/hole-0108-lr00004_ms/train/model.ckpt-300000"
PATH_TO_DATASET="${ROOT}/${DATA_VERSION}/tfrecord"

PATH_TO_TRAIN_DIR="${ROOT}/${DATA_VERSION}/${EXP_NAME}/train"
PATH_TO_EVAL_DIR="${ROOT}/hole_eval/${EXP_NAME}"
PATH_TO_VIS_DIR="${ROOT}/${DATA_VERSION}/${EXP_NAME}/vis"
EXPORT_DIR="${ROOT}/${DATA_VERSION}/${EXP_NAME}/export"
