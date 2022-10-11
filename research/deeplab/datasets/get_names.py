import os
import shutil
import argparse
from PIL import Image
 

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data_root', type=str, default='', help='')
    args = parser.parse_args()
    return args


def main():
    args = parse_args()
    data_root = os.path.abspath(args.data_root)
    train_path = data_root + '/train/'
    filelist_train = sorted(os.listdir(train_path))
    val_path = data_root + '/val/'
    filelist_val = sorted(os.listdir(val_path))
    test_path = data_root + '/test/'
    filelist_test = sorted(os.listdir(test_path))
    index_path = data_root + '/index/'

    VOC_file_dir = index_path

    VOC_train_file = open(os.path.join(VOC_file_dir, "train.txt"), 'w')
    VOC_val_file = open(os.path.join(VOC_file_dir, "val.txt"), 'w')
    VOC_test_file = open(os.path.join(VOC_file_dir, "trainval.txt"), 'w')
    VOC_train_file.close()
    VOC_val_file.close()
    VOC_test_file.close()

    VOC_train_file = open(os.path.join(VOC_file_dir, "train.txt"), 'a')
    VOC_val_file = open(os.path.join(VOC_file_dir, "val.txt"), 'a')
    VOC_test_file = open(os.path.join(VOC_file_dir, "trainval.txt"), 'a')

    for eachfile in filelist_train:
        (temp_name, temp_extention) = os.path.splitext(eachfile)
        img_name = temp_name
        VOC_train_file.write(img_name + '\n')

    for eachfile in filelist_val:
        (temp_name, temp_extention) = os.path.splitext(eachfile)
        img_name = temp_name
        VOC_val_file.write(img_name + '\n')

    for eachfile in filelist_test:
        (temp_name, temp_extention) = os.path.splitext(eachfile)
        img_name = temp_name
        VOC_test_file.write(img_name + '\n')

    VOC_train_file.close()
    VOC_val_file.close()
    VOC_test_file.close()


if __name__ == '__main__':
    main()

 
 