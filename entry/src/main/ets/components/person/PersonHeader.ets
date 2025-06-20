// 头部信息



import { router } from '@kit.ArkUI'
import { KFDiaLogComp } from '../CustomDiaLogComp/KFDiaLogcomp'


@Component
export struct PersonHeader {
  controller: CustomDialogController = new CustomDialogController({
    builder: KFDiaLogComp()
  })

  build() {

    Column() {
      // 头像
      Row({ space: 15 }) {
        Blank()
        Image('/image/客服 (2).svg')
          .width(35)
          .height(35)
          .width(30)
          .height(30)
          .onClick(() => {
            this.controller.open()
          })
        Image('/image/设置.svg')
          .width(30)
          .height(30)
      }.width('100%')
      .height(30)
      .justifyContent(FlexAlign.SpaceEvenly)

      Row({ space: 10 }) {
        Image('/image/touxiang.png')
          .width(70)
          .height(70)
          .borderRadius(50)
        Text('丁真把马驾骑')
          .fontSize(25)
          .textAlign(TextAlign.Start)
          .fontColor(Color.Yellow)

      }.width('90%')
      .height(30)

      Row({ space: 20 }) {
        Text('关注 3').fontSize(15).fontWeight(10).fontColor('#fff')
        Text('粉丝 2').fontSize(15).fontWeight(10).fontColor('#fff')
        Text('勋章 1').fontSize(15).fontWeight(10).fontColor('#fff')
      }.width('90%')
      .height(30)

    }
    .width('100%')
    .height('30%')
    .backgroundImage('/image/back.png', ImageRepeat.NoRepeat)
    .backgroundImageSize({ width: '100%', height: '100%' })
    .backgroundBlurStyle(BlurStyle.BACKGROUND_THIN)
    .justifyContent(FlexAlign.SpaceAround)
  }
}