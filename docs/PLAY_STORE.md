# Google Play 上架清单

账号审核通过之后按顺序做。商店文案和图形在 `android/fastlane/metadata/android/` 下。

## 1. 包名（上架后不能改）

当前包名是 `io.github.yingqiu0871.petit_coin`，在 `android/app/build.gradle.kts` 的 `applicationId` 里。上传第一个版本之前定好，之后再改就只能当作一个新应用重新上架。

## 2. 上传密钥

Play 使用“Play 应用签名”：Google 保管真正的发布密钥，我们只用一把上传密钥给 AAB 签名。上传密钥丢了可以向 Google 申请重置，但最好别丢。

在自己电脑上生成（需要装 JDK）：

```bash
keytool -genkeypair -v -keystore upload.jks -alias upload \
  -keyalg RSA -keysize 2048 -validity 10000
```

把 `upload.jks` 和两个密码存进密码管理器，不要提交进仓库（`.gitignore` 已经忽略 `*.jks` 和 `key.properties`）。

然后在 GitHub 仓库 Settings › Secrets and variables › Actions 里添加四个 secret：

| 名称 | 内容 |
| --- | --- |
| `PETIT_COIN_KEYSTORE_BASE64` | `base64 -w0 upload.jks` 的输出（macOS 用 `base64 -i upload.jks`） |
| `PETIT_COIN_KEYSTORE_PASSWORD` | 密钥库密码 |
| `PETIT_COIN_KEY_ALIAS` | `upload` |
| `PETIT_COIN_KEY_PASSWORD` | 密钥密码 |

设置好以后，推送 `v*` 标签时，Release 工作流会额外生成签好名的 `.aab`，附在 GitHub Release 里，下载后上传到 Play 管理中心。

本地打包也可以：在 `android/key.properties` 写入

```properties
storeFile=/绝对路径/upload.jks
storePassword=...
keyAlias=upload
keyPassword=...
```

然后运行 `flutter build appbundle --release`。

## 3. 封闭测试（新个人账号必须）

2023 年 11 月之后注册的个人开发者账号，要先做封闭测试：至少 12 名测试者连续 14 天保持加入，然后才能申请正式发布。可以先邀请朋友，用 Google 群组或邮箱名单加入测试轨道。

## 4. 商店信息

| 项目 | 位置 / 草稿 |
| --- | --- |
| 应用名、简短说明、完整说明 | `metadata/android/<语言>/`，共 12 种 |
| 应用图标 512×512 | `metadata/android/en-US/images/icon.png` |
| 置顶大图 1024×500 | `metadata/android/en-US/images/featureGraphic.png` |
| 手机截图（至少 2 张） | 模拟器 CI 产出的截图，见 `emulator-screenshots` 分支 |
| 隐私权政策网址 | `https://github.com/YingQiu0871/Petit-Coin/blob/main/PRIVACY.md` |
| 联系邮箱 | petitcoin@yingqiu.me |
| 类别 | 地图和导航 |

## 5. 应用内容问卷（草稿答案，提交前请核对）

**数据安全**

- 是否收集或分享用户数据：是。
- 大致位置：收集（地图范围会发给 Overpass API 和地图瓦片服务以加载附近厕所），不分享，临时处理、不存储，属于核心功能所必需。
- 精确位置：只在手机上计算距离，不离开设备，所以不算“收集”。
- 其他数据（姓名、邮箱、照片、通讯录、应用活动、崩溃日志）：当前版本都不收集。
- 传输加密：是（全部为 HTTPS）。
- 用户可否请求删除数据：可以，通过 petitcoin@yingqiu.me。

**其他**

- 广告：不含广告。
- 目标受众：16 岁及以上（隐私条款写的是不面向 15 岁以下）。
- 内容分级：填 IARC 问卷，没有暴力、色情、赌博、用户互动内容，预计为“所有人 / PEGI 3”。
- 定位权限：只在前台使用，不需要后台定位声明。
- 政府应用、金融功能、健康功能：都不是。

## 6. 上架前还要补的

- `PRIVACY.md` 第 1 节的运营主体名称和地址。
- 隐私条款请熟悉 GDPR 的人审一遍。
- 中文商店截图（目前的模拟器截图是英文界面）。
