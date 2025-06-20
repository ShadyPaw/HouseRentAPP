// 功能图标区
import { createCollaborationCameraMenuItems } from '@hms.collaboration.camera'
import { router } from '@kit.ArkUI'

@Styles
function Icon() {
  .width(30)
  .height(30)
  .padding({ bottom: 5 })
}

@Styles
function IconCol() {
  .padding({ left: 10, right: 10, top: 10 })
}

@Component
export struct IconComp {
  build() {
    Row({ space: 20 }) {

      Column() {
        Image('/image/personal_cart.png').Icon()
        Text('心仪好房')
      }
      .onClick(()=>{
        router.pushUrl({url:"components/CollectComp/LoveDetailsComp"})
      })
      .IconCol()



      Column() {
        Image('/image/personal_evaluate.png').Icon()
        Text('回复我的')
      }.IconCol()



      Column() {
        Image('/image/personal_record.png').Icon()
        Text('订单记录')
      }.IconCol()



    }.width('90%')
    .height(60)
    .borderRadius(6)
    .backgroundColor('#fffdfcfc')
    .justifyContent(FlexAlign.SpaceAround)
  }
}