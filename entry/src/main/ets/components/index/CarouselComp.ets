// 搜索框
import { router } from '@kit.ArkUI'
import { edgeWidths } from '@ohos.arkui.node'

@Component
export struct CarouselComp {
  build() {
    Row({ space: 10 }) {
      Text("重庆合川")
      Row() {
        Row() {
          TextInput().width("80%")
            .borderColor('#ccc')
            .borderWidth(edgeWidths(0.5))
            .backgroundColor("white")
            .height(30)
          Image("image/search.png")
            .width(20)
        }.width('100%')
        .justifyContent(FlexAlign.SpaceAround)
      }
      .backgroundColor("white")
      .height(30)
      .borderRadius(5)
      .layoutWeight(1)
      .onClick(() => {
        router.pushUrl({
          url: "pages/SearchPage"
        })
      })

      Image("image/address.png")
        .width(25)
    }.padding({ left: 10, right: 10 })
  }
}