set -e

version="_v11"
data_labelme="./data_annotated"${version}
data_voc="./data_dataset_voc"${version}
echo "data_labelme:"${data_labelme}"data_voc:"${data_voc}

ln -s "/mnt/disk/lifei/data_dataset_voc${version}" "./data_dataset_voc${version}"
# python labelme2voc_o.py ${data_labelme} ${data_voc} --labels labels.txt

# python remove_gt_colormap.py \
# --original_gt_folder=${data_voc}"/SegmentationClassPNG" \
# --output_dir=${data_voc}"/SegmentationClassPNG-raw"

DATASET_NAME="data"${version}
echo "dataset_name:"${DATASET_NAME}
mkdir $(pwd)"/"${DATASET_NAME}
mkdir $(pwd)"/"${DATASET_NAME}"/image"
mkdir $(pwd)"/"${DATASET_NAME}"/index"
mkdir $(pwd)"/"${DATASET_NAME}"/mask"
mkdir $(pwd)"/"${DATASET_NAME}"/test"
mkdir $(pwd)"/"${DATASET_NAME}"/testannot"
mkdir $(pwd)"/"${DATASET_NAME}"/tfrecord"
mkdir $(pwd)"/"${DATASET_NAME}"/train"
mkdir $(pwd)"/"${DATASET_NAME}"/trainannot"
mkdir $(pwd)"/"${DATASET_NAME}"/val"
mkdir $(pwd)"/"${DATASET_NAME}"/valannot"

find ${data_voc}/JPEGImages/ -name "*.*" |xargs -i cp {} $(pwd)/${DATASET_NAME}/image
find ${data_voc}/SegmentationClassPNG-raw/ -name "*.*" |xargs -i cp {} $(pwd)/${DATASET_NAME}/mask

python get_train_val.py --data_root $(pwd)"/"${DATASET_NAME}
python get_names.py --data_root $(pwd)"/"${DATASET_NAME}

python ./build_voc2012_data.py \
--image_folder=$(pwd)"/"${DATASET_NAME}"/image" \
--semantic_segmentation_folder=$(pwd)"/"${DATASET_NAME}"/mask" \
--list_folder=$(pwd)"/"${DATASET_NAME}"/index" \
--image_format="jpg" \
--output_dir=$(pwd)"/"${DATASET_NAME}"/tfrecord"

# 注册数据集