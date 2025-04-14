#!/bin/bash

# 1. تثبيت المتطلبات الأساسية (Fedora)
sudo dnf install -y git dkms kernel-devel kernel-headers gcc make elfutils-libelf-devel

# 2. تنزيل المستودع
git clone https://github.com/samveen/mt7902-dkms.git
cd mt7902-dkms

# 3. نسخ الملفات لمجلد DKMS
sudo mkdir -p /usr/src/mt7902-1.0
sudo cp -r * /usr/src/mt7902-1.0

# 4. بناء وتثبيت الدرايفر عبر DKMS
sudo dkms add mt7902/1.0
sudo dkms build mt7902/1.0
sudo dkms install mt7902/1.0

# 5. تحميل الوحدة
sudo modprobe mt7902e

# 6. التحقق من التثبيت
echo "----- تحقق من ظهور 'mt7902e' في القائمة أدناه -----"
lspci -k | grep -iA3 network

echo "----- تحقق من وجود واجهة الواي فاي -----"
iwconfig
