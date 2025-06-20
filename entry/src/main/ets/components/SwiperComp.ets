@Component
export struct SwiperComp {
  // private SwiperList :string[] = ["image/port1.png","image/port2.png","image/port3.png","image/port4.png"]
  private DISPLAY_COUNT: number = 1
  private MIN_SCALE: number = 0.8
  @State images: string[] =
    ['https://tse1-mm.cn.bing.net/th/id/OIP-C.vVIiu4gWajSFGNALyVCPbAHaLK?w=203&h=306&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    'https://tse3-mm.cn.bing.net/th/id/OIP-C.19kQzk1ZHr1swtxGd2mtzgHaJ3?w=206&h=275&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    'https://tse4-mm.cn.bing.net/th/id/OIP-C.UeGNeaI7aj7ltRtQnLyGqgHaKW?w=206&h=288&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    'https://tse3-mm.cn.bing.net/th/id/OIP-C.537_NnqWTROtaHLt5x0SRwHaDt?w=323&h=175&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    'https://tse2-mm.cn.bing.net/th/id/OIP-C.yr3_AyWycm9MZZ5DViXmdQAAAA?w=286&h=168&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    'https://tse1-mm.cn.bing.net/th/id/OIP-C.uHD-gTw3EmyVcyBdwzknRgHaDD?w=341&h=144&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3']
  @State opacityList: number[] = []
  @State scaleList: number[] = []
  @State translateList: number[] = []
  @State zIndexList: number[] = []

  aboutToAppear(): void {
    for (let i = 0; i < this.images.length; i++) {
      this.opacityList.push(1.0)
      this.scaleList.push(1.0)
      this.translateList.push(0.0)
      this.zIndexList.push(0)
    }
  }

  build() {
    Column() {
      Swiper() {
        ForEach(this.images, (images: string, index: number) => {

          Image(images)
            .width('100%')// 自定义动画变化透明度、缩放页面、抵消系统默认位移、渲染层级等
            .opacity(this.opacityList[index])
            .scale({ x: this.scaleList[index], y: this.scaleList[index] })
            .translate({ x: this.translateList[index] })
            .zIndex(this.zIndexList[index])
        })
      }
      .height(200)
      .indicator(true)
      .autoPlay(true)
      .displayCount(this.DISPLAY_COUNT, true)
      .customContentTransition({
        // 页面移除视窗时超时1000ms下渲染树
        timeout: 1000,
        // 对视窗内所有页面逐帧回调transition，在回调中修改opacity、scale、translate、zIndex等属性值，实现自定义动画
        transition: (proxy: SwiperContentTransitionProxy) => {
          if (proxy.position <= proxy.index % this.DISPLAY_COUNT ||
            proxy.position >= this.DISPLAY_COUNT + proxy.index % this.DISPLAY_COUNT) {
            // 同组页面往左滑或往右完全滑出视窗外时，重置属性值
            this.opacityList[proxy.index] = 1.0
            this.scaleList[proxy.index] = 1.0
            this.translateList[proxy.index] = 0.0
            this.zIndexList[proxy.index] = 0
          } else {
            // 同组页面往右滑且未滑出视窗外时，对同组中左右两个页面，逐帧根据position修改属性值，实现两个页面往Swiper中间靠拢并透明缩放的自定义切换动画
            if (proxy.index % this.DISPLAY_COUNT === 0) {
              this.opacityList[proxy.index] = 1 - proxy.position / this.DISPLAY_COUNT
              this.scaleList[proxy.index] =
                this.MIN_SCALE + (1 - this.MIN_SCALE) * (1 - proxy.position / this.DISPLAY_COUNT)
              this.translateList[proxy.index] =
                -proxy.position * proxy.mainAxisLength + (1 - this.scaleList[proxy.index]) * proxy.mainAxisLength / 2.0
            } else {
              this.opacityList[proxy.index] = 1 - (proxy.position - 1) / this.DISPLAY_COUNT
              this.scaleList[proxy.index] =
                this.MIN_SCALE + (1 - this.MIN_SCALE) * (1 - (proxy.position - 1) / this.DISPLAY_COUNT)
              this.translateList[proxy.index] = -(proxy.position - 1) * proxy.mainAxisLength -
                (1 - this.scaleList[proxy.index]) * proxy.mainAxisLength / 2.0
            }
            this.zIndexList[proxy.index] = -1
          }
        }
      })
      .onContentDidScroll((selectedIndex: number, index: number, position: number, mainAxisLength: number) => {
        // 监听Swiper页面滑动事件，在该回调中可以实现自定义导航点切换动画等
        console.info("onContentDidScroll selectedIndex: " + selectedIndex + ", index: " + index + ", position: " +
          position + ", mainAxisLength: " + mainAxisLength)
      })
    }.width('100%')
  }
}