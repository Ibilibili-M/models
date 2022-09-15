data_voc="/home/lifei/models/research/deeplab/datasets/data_voc_v4"
python remove_gt_colormap.py \
--original_gt_folder=${data_voc}"/SegmentationClassPNG" \
--output_dir=${data_voc}"/SegmentationClassPNG-raw"