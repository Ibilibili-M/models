set -e

version="_v4"
data_labelme="./data_annotated"${version}
data_voc="./data_dataset_voc"${version}
echo "data_labelme:"${data_labelme}"data_voc:"${data_voc}
# python labelme2voc_o.py ${data_labelme} ${data_voc} --labels labels.txt

# python remove_gt_colormap.py \
# --original_gt_folder=${data_voc}"/SegmentationClassPNG" \
# --output_dir=${data_voc}"/SegmentationClassPNG-raw"

DATASET_NAME="data"${version}
# echo "dataset_name:"${DATASET_NAME}
# mkdir $(pwd)"/"${DATASET_NAME}
# mkdir $(pwd)"/"${DATASET_NAME}"/image"
# mkdir $(pwd)"/"${DATASET_NAME}"/index"
# mkdir $(pwd)"/"${DATASET_NAME}"/mask"
# mkdir $(pwd)"/"${DATASET_NAME}"/test"
# mkdir $(pwd)"/"${DATASET_NAME}"/testannot"
# mkdir $(pwd)"/"${DATASET_NAME}"/tfrecord"
# mkdir $(pwd)"/"${DATASET_NAME}"/train"
# mkdir $(pwd)"/"${DATASET_NAME}"/trainannot"
# mkdir $(pwd)"/"${DATASET_NAME}"/val"
# mkdir $(pwd)"/"${DATASET_NAME}"/valannot"

# # cp -r ${data_voc}"/JPEGImages/*" $(pwd)"/"${DATASET_NAME}"/image"
# # cp -r ${data_voc}"/SegmentationClassPNG-raw/*" $(pwd)"/"${DATASET_NAME}"/mask"

# find ./data_dataset_voc_v4/JPEGImages/ -name "*.*" |xargs -i cp {} ./data_v4/image
# find ./data_dataset_voc_v4/SegmentationClassPNG-raw/ -name "*.*" |xargs -i cp {} ./data_v4/mask

# python get_train_val.py

# python get_names.py

python ./build_voc2012_data.py \
--image_folder=$(pwd)"/"${DATASET_NAME}"/image" \
--semantic_segmentation_folder=$(pwd)"/"${DATASET_NAME}"/mask" \
--list_folder=$(pwd)"/"${DATASET_NAME}"/index" \
--image_format="jpg" \
--output_dir=$(pwd)"/"${DATASET_NAME}"/tfrecord"

# 注册数据集