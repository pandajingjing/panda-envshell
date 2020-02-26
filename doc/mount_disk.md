## 挂载数据盘的步骤

### 对数据盘分区(只分一个区)
命令|注释
----|----
fdisk -l|查看硬盘信息, 包括硬盘数量及相应分区等
fdisk /dev/sdb|对sdb分区, 下面按照顺序选择
n|创建分区
p|创建主分区
1|创建主分区的编号
默认|选择开始和结束的扇区号
w|写分区表

### 对分区进行格式化
命令|注释
----|----
mkfs -t ext4 /dev/sdb1|把/dev/sdb1分区格式化为ext4文件格式
mount /dev/sdb1 \$sDynamicDataInstallDir|把/dev/sdb1分区挂载到\$sDynamicDataInstallDir下

### 启动自动挂载分区
命令|注释
----|----
vi /etc/fstab|编辑fstab文件
/dev/vdb1 /dynamic-data auto defaults 0 0|添加此行