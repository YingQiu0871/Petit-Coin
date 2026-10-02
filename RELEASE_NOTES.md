## Petit Coin 0.2.0 · 方便点 第二个预览版

First build for the Google Play closed test. 首个用于 Google Play 封闭测试的版本。

- New app id `me.yingqiu.petitcoin`. Uninstall 0.1.0 first; the two are separate apps.
  应用 ID 改为 `me.yingqiu.petitcoin`，请先卸载 0.1.0，两者会被当作不同的应用。
- Signed with the Play upload key; a Play bundle (.aab) is attached alongside the APK.
  使用上传密钥签名，附带用于 Google Play 的 .aab 安装包。
- 12 languages following the phone's language, including Traditional Chinese, Japanese and Korean.
  跟随系统语言，支持 12 种语言，新增繁体中文、日文、韩文等。

### What's in it 功能

- Map of nearby public toilets in France from OpenStreetMap, with filters: open now, free, accessible, baby change.
  地图显示附近公共厕所（OpenStreetMap 数据），可按正在开放、免费、无障碍、母婴台筛选。
- Toilet details: hours, walking time, facilities, data source, walking directions.
  厕所详情：开放时间、步行时间、设施、数据来源、步行导航。
- Material 3 with frosted-glass panels; dynamic color or eight preset palettes.
  Material 3 + 毛玻璃界面，动态取色或 8 组预制配色。
- Privacy consent on first launch; analytics off by default.
  首次启动需同意隐私条款，匿名统计默认关闭。

### Install 安装

Download the APK below and open it on your Android phone (allow installing from this source when asked).
下载下面的 APK，在安卓手机上打开安装（按提示允许安装未知来源应用）。

### Known limitations 已知限制

- No iOS build yet. 暂无 iOS 版本。
- Toilet data is fetched live from the Overpass API; reporting problems is not available yet.
  厕所数据实时从 Overpass API 获取，"报告问题"功能尚未开放。

Data © OpenStreetMap contributors, ODbL. Code under Apache 2.0.
