ROOT="/home/lifei/models/research/deeplab/datasets/"
DATA_VERSION="data_v20-bj"
EXP_NAME="${DATA_VERSION}_exp-0213-xception71-lr00004"

# PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/deeplabv3_pascal_train_aug/model.ckpt"
# PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/data_v11-v2/exp-1013/train/model.ckpt-800000"
# PATH_TO_INITIAL_CHECKPOINT="/home/lifei/models/research/deeplab/datasets/data_v13/exp-1104-lr00006/train/model.ckpt-500000"
PATH_TO_DATASET="${ROOT}/${DATA_VERSION}/tfrecord"

PATH_TO_TRAIN_DIR="${ROOT}/${DATA_VERSION}/${EXP_NAME}/train"
PATH_TO_EVAL_DIR="${ROOT}/eval/${EXP_NAME}"
PATH_TO_VIS_DIR="${ROOT}/${DATA_VERSION}/${EXP_NAME}/vis"
EXPORT_DIR="${ROOT}/${DATA_VERSION}/${EXP_NAME}/export"
