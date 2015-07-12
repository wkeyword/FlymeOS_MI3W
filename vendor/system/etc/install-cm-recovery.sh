#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 13211648 bfc4f7aa495cb1c2880be7110fa9e36519d79b21 10573824 08fff366599600d4e58abab5f081c3487130fe69
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:13211648:bfc4f7aa495cb1c2880be7110fa9e36519d79b21; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:10573824:08fff366599600d4e58abab5f081c3487130fe69 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery bfc4f7aa495cb1c2880be7110fa9e36519d79b21 13211648 08fff366599600d4e58abab5f081c3487130fe69:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
