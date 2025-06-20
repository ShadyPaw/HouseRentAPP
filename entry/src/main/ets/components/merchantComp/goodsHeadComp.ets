import { router } from '@kit.ArkUI'

@Component
export struct goodsHeadComp {
  build() {
    Row() {
      Button({ type: ButtonType.Normal, stateEffect: false, buttonStyle: ButtonStyleMode.TEXTUAL }) {
        Image('/image/zuojiantou.png').width(25)
      }
      .margin({ right: 4 })
      .onClick(() => {
        router.back()
      })

      Row({ space: 5 }) {
        TextInput({ placeholder: '您想搜索的内容'}).height(30).layoutWeight(1)
          .fontColor('#fff')
          .fontSize(12)
          .placeholderColor('#fff')
          .placeholderFont({size:14})

        Button({ type: ButtonType.Normal, buttonStyle: ButtonStyleMode.TEXTUAL, stateEffect: false }) {
          Image('/image/searchwhite.png').width(25)
        }
      }.layoutWeight(1).border({width:1,radius:30,color: '#ffd4d0d0' })
      .padding({left:8,right:8})

      Button({ type: ButtonType.Normal, stateEffect: false, buttonStyle: ButtonStyleMode.TEXTUAL }) {
        Image('/image/othree.png').width(25).margin({left:7})
      }
      .margin({ right: 7 })
    }.width('100%')
    .padding(5)
    .backgroundColor('#ff8d2919')
  }
}