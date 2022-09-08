ROOT="/home/lifei/models/research/deeplab/datasets/"
DATA_VERSION="data_v3"
EXP_NAME="exp-0908"

PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/deeplabv3_pascal_train_aug/model.ckpt"
# PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/data_v1/exp-0610/train/model.ckpt-800000"
PATH_TO_DATASET="${ROOT}/${DATA_VERSION}/tfrecord"

PATH_TO_TRAIN_DIR="${ROOT}/${DATA_VERSION}/${EXP_NAME}/train"
PATH_TO_EVAL_DIR="${ROOT}/${DATA_VERSION}/${EXP_NAME}/eval"
PATH_TO_VIS_DIR="${ROOT}/${DATA_VERSION}/${EXP_NAME}/vis"
EXPORT_DIR="${ROOT}/${DATA_VERSION}/${EXP_NAME}/export"
