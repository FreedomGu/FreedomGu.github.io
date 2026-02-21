# 悬停加载效果说明

## 实现方式

采用了与 [Heyuan Li 的个人主页](https://lhyfst.github.io/) 相同的 opacity 透明度切换方法。

## 核心原理

### 1. HTML 结构
使用两层叠加的图像/视频：
- 外层 `div.one`：作为容器（`position: relative`）
- 内层 `div.two`：包含视频，初始 `opacity: 0`（透明）
- 静态图片：作为缩略图，始终存在

```html
<div class="one">
  <div class="two" id="xxx_video" style="opacity: 0;">
    <video width="100%" muted autoplay loop>
      <source src="path/to/video.mp4" type="video/mp4">
    </video>
  </div>
  <img src="path/to/thumbnail.jpg" width="450">
</div>
```

### 2. CSS 过渡效果
`.two` 类已经在全局 CSS 中定义了平滑的透明度过渡：
```css
.two {
  width: 160px;
  height: 160px;
  position: absolute;
  transition: opacity .2s ease-in-out;
  -moz-transition: opacity .2s ease-in-out;
  -webkit-transition: opacity .2s ease-in-out;
}
```

### 3. JavaScript 交互
每个项目都有独立的 JavaScript 函数：
```javascript
function xxx_start() {
  document.getElementById('xxx_video').style.opacity = "1";
}
function xxx_stop() {
  document.getElementById('xxx_video').style.opacity = "0";
}
xxx_stop() // 初始化为透明
```

### 4. 事件绑定
在 `<tr>` 标签上绑定鼠标事件：
```html
<tr onmouseout="xxx_stop()" onmouseover="xxx_start()">
```

## 效果说明

1. **初始状态**：静态缩略图显示，视频透明（opacity: 0）
2. **鼠标悬停**：视频渐显（opacity: 1），因为叠加在上方，覆盖了缩略图
3. **鼠标移开**：视频渐隐（opacity: 0），缩略图重新可见
4. **平滑过渡**：0.2秒的 ease-in-out 过渡效果

## 优势

- ✅ 平滑的淡入淡出效果
- ✅ 视频循环播放（autoplay loop）
- ✅ 代码简洁易维护
- ✅ 每个项目独立控制

## 已更新的项目

### 视频项目（需要缩略图）：
1. **ENVISION** - `envision_start/stop()`
   - 缩略图：`./ENVISION/env/demos/Envision_demo_thumb.jpg`
   - 视频：`./ENVISION/env/demos/Envision_demo.mp4`

2. **BalanceHead** - `balancehead_start/stop()`
   - 缩略图：`./ICLR2026/balancehead_after_thumb.jpg`
   - 视频：`./ICLR2026/balancehead_after.mp4`

3. **DiffPortrait360** - `diffportrait360_start/stop()`
   - 缩略图：`./DiffPortrait360/Diff360/Teaser_video_thumb.jpg`
   - 视频：`./DiffPortrait360/Diff360/Teaser_video.mp4`

### GIF 项目（直接使用 GIF）：
4. **DiffPortrait3D** - `diffportrait3d_start/stop()`
   - GIF：`diffportrait3d_teaser.gif`

5. **DisUnknown (ICCV2021)** - `iccv2021_start/stop()`
   - 图片：`ICCV2021.png`

6. **One-Shot** - `oneshot_start/stop()`
   - GIF：`one-shot.gif`

7. **DeepFake** - `deepfake_start/stop()`
   - GIF：`deepfake.gif`

## 生成视频缩略图

已提供 `generate_thumbnails.sh` 脚本来从视频提取第一帧：

```bash
cd /Users/yuminggu/Documents/GitHub/FreedomGu.github.io
./generate_thumbnails.sh
```

**前置要求**：需要安装 ffmpeg
```bash
brew install ffmpeg
```

## 注意事项

1. 视频在页面加载时就会下载，但通过 `opacity: 0` 隐藏
2. 适合视频文件不是特别多的场景
3. 确保缩略图文件存在，否则页面会显示空白
4. GIF 文件使用相同的方式，但上下两层都是同一个 GIF（为了保持代码一致性）
