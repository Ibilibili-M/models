#!/usr/bin/env python
import numpy as np
import os
import sys
import argparse
import os.path
from PIL import Image


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data_root', type=str, default='', help='')
    args = parser.parse_args()
    return args


def main():
    args = parse_args()
    data_root = os.path.abspath(args.data_root)
    ###############################
    #处理原图
    url = data_root + '/'  #图片存储的文件夹名称
    src_url = url + 'image/'
    mask_url = url + 'mask/'
    pathlist=os.listdir(src_url)
    n=len(pathlist)#图片的数量
    array = np.arange(n)#产生长度为n的序列
    np.random.shuffle(array)#将arrray序列随机排列
    #把path文件夹下以及其子文件下的所有.jpg图片移动到new_path文件夹下
    def moveImg(path,new_path):
        img=Image.open(path)
        img.save(os.path.join(new_path,os.path.basename(path)))
    #30%的数据生成验证集
    src_new_path = url + 'val/'
    mask_new_path = url + 'valannot/'
    i=0
    while(i <= (int(n*0.00001))):
        src_str = pathlist[array[i]]
        DatasetPath = src_url  + src_str
        print('path: ',DatasetPath)
        moveImg(DatasetPath,src_new_path)
        # mask_str = src_str.replace("jpg","png")
        mask_str = src_str
        DatasetPath = mask_url  + mask_str
        print('path: ',DatasetPath)
        moveImg(DatasetPath,mask_new_path)
        i=i+1
    #70%的数据生成训练集
    src_new_path = url + 'train/'
    mask_new_path = url + 'trainannot/'
    while(i <= (n-1)):
        src_str = pathlist[array[i]]
        DatasetPath = src_url + src_str
        print('path: ',DatasetPath)
        moveImg(DatasetPath,src_new_path)
        # mask_str = src_str.replace("jpg","png")
        mask_str = src_str
        DatasetPath = mask_url  + mask_str
        print('path: ',DatasetPath)
        moveImg(DatasetPath,mask_new_path)
        i=i+1


if __name__ == '__main__':
    main()

