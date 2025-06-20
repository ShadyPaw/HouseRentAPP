import { videoList } from '../../modules/VideoList'
import { BasicDataSource } from '../../utils/LazyForEachUtils'
import { window } from '@kit.ArkUI'
import { common } from '@kit.AbilityKit'

@Component
export struct videoComp {
  private videoList: BasicDataSource = new BasicDataSource() /*视频列表*/
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X /*播放倍速*/
  @State isPlay: boolean = false /*视频是否处于播放状态*/
  @State btnImage: string | Resource = '/image/video_start.png' /*播放或暂停*/
  @State isFullScreen: boolean = false /*是否处于全屏播放状态*/
  private context = getContext(this) as common.UIAbilityContext;

  aboutToAppear(): void {
    this.videoList.addData({
      id: 1,
      cover: 'http://i2.hdslb.com/bfs/archive/f9bbd9ee7db1aa0644837f7839392115c4152b2c.jpg',
      title: '青年大学习之租房篇',
      href: 'http://vjs.zencdn.net/v/oceans.mp4',
      controller: new VideoController()
    })
    this.videoList.addData({
      id: 2,
      cover: 'http://i0.hdslb.com/bfs/archive/ef7d10570811a61b373eab8aad1bace2770927fc.jpg',
      title: '租房流程和租房的坑都在这',
      href: 'http://vfx.mtime.cn/Video/2024/01/30/mp4/240130090252581185.mp4',
      controller: new VideoController()
    })
    this.videoList.addData({
      id: 3,
      cover: 'http://i0.hdslb.com/bfs/archive/09592a945b2cfd1147b976bff69583803442a4cf.jpg',
      title: '夜访吸血鬼 新短预告',
      href: 'http://www.w3school.com.cn/example/html5/mov_bbb.mp4',
      controller: new VideoController()
    })
  }

  async toggleFullScreen() {
    try {
      const windowClass = await window.getLastWindow(this.context);
      if (this.isFullScreen) {
        await windowClass.setFullScreen(false);
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
      } else {
        await windowClass.setFullScreen(true);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
      }
      this.isFullScreen = !this.isFullScreen;
    } catch (err) {
      console.error('Failed to toggle fullscreen:', err);
    }
  }

  build() {
    Grid() {
      LazyForEach(this.videoList, (item: videoList, index: number) => {
        GridItem() {
          Column() {
            Video({
              src: item.href,
              previewUri: item.cover,
              controller: item.controller
            })
              .controls(false)
              .height(180)
              .borderRadius(8)
              .margin({ bottom: 8 })
              .onStart(() => {
                this.isPlay = true
              })
              .onPause(() => {
                this.isPlay = false
              })

            Row() {
              // Image(this.btnImage)
              //   .width(21)
              //   .height(21)
              //   .padding({ right: 5 })
              //   .objectFit(ImageFit.Fill)
              //   .onClick(() => {
              //     if (this.isPlay) {
              //       item.controller.pause()
              //       this.btnImage = '/image/video_start.png'
              //     } else {
              //       item.controller.start()
              //       this.btnImage = '/image/video_pause.png'
              //     }
              //   })
              Image('/image/video_start.png')
                .width(21)
                .height(21)
                .padding({ right: 5 })
                .objectFit(ImageFit.Fill)
                .onClick(() => {
                  item.controller.start()
                })
              Image('/image/video_pause.png')
                .width(21)
                .height(21)
                .padding({ right: 5 })
                .objectFit(ImageFit.Fill)
                .onClick(() => {
                  item.controller.pause()
                })
              // Button(this.isFullScreen ? '退出全屏' : '全屏')
              //   .onClick(() => this.toggleFullScreen())
              //   .width(21)
              //   .height(21)
              //   .padding({ right: 5 })
              //   .backgroundColor(Color.Transparent)
              //   .fontColor(Color.White)
              //   .border({ color: Color.Red })
              Text(item.title)
                .width(100)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .maxLines(2)
            }.padding(10)

          }
          .backgroundColor(Color.White)
          .borderRadius(12)
          .shadow({
            radius: 4,
            color: 'rgba(0, 0, 0, 0.1)',
            offsetX: 0,
            offsetY: 2
          })
          .padding({ bottom: 10 })
        }
        .padding(8)
      }, (item: videoList, index: number) => {
        return `${item.id}+${index}`
      })
    }
    .columnsTemplate('1fr 1fr')
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
    .padding(8)
  }
}