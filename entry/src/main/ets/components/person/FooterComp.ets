// 底部区域
@Component
export struct FooterComp {
  @Styles
  Icon(){
    .width(30)
    .height(30)
    .padding({ bottom: 5 })
  }

  build() {
    Grid() {
      GridItem() {
        Column() {
          Image('/image/合同.svg').Icon()
          Text('查看合同')
        }
      }.padding(10)

      GridItem() {
        Column() {
          Image('/image/咨询.svg').Icon()
          Text('服务咨询')
        }
      }.padding(10)

      GridItem() {
        Column() {
          Image('/image/发票.svg').Icon()
          Text('查看发票')
        }
      }.padding(10)

      GridItem() {
        Column() {
          Image('/image/加入我们.svg').Icon()
          Text('加入我们')
        }
      }.padding(10)

      GridItem() {
        Column() {
          Image('/image/关于.svg').Icon()
          Text('关于软件')
        }
      }.padding(10)

      GridItem() {
        Column() {
          Image('/image/公众号.svg').Icon()
          Text('公众号')
        }
      }.padding(10)

      GridItem() {
        Column() {
          Image('/image/反馈.svg').Icon()
          Text('反馈功能')
        }
      }.padding(10)

      GridItem() {
        Column() {
          Image('/image/线下门店.svg').Icon()
          Text('线下门店')
        }
      }.padding(10)
    }.maxCount(4)
    .layoutDirection(GridDirection.Row)
  }
}