import { HeaderComp } from '../components/index/HeaderComp'
import { JDBean } from '../components/Tabs/JDComp'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct JDPage {
  JDData:JDBean = new JDBean("","","","","",[])
  aboutToAppear(): void {
      this.JDData = router.getParams() as JDBean
  }


  build() {
    Column({space:10}){
      HeaderComp()
      Row({space:30}){
        Text("←")
          .fontSize(25)
          .margin({left:5})
          .onClick(()=>{
            router.back()
          })
        Text(this.JDData.name)
          .fontSize(22)
      }
      .width("100%")
      Swiper(){
          ForEach(this.JDData.detailimg,(item:string)=> {
            Column({ space: 10 }) {
              Image(item)
                .width("100%")
                .height(230)
                .borderRadius(10)
            }
          })
        }
        .autoPlay(true)
        Column({space:15}){
          Text("门店描述："+this.JDData.detail)
          Divider()
          Row({space:5}){
            Image("image/地址.svg")
              .width(25)
            Text("门店地址："+this.JDData.address)
          }
          .width("100%")
          .margin({left:10})
          Row({space:5}){
            Image("image/电话 (1).svg")
              .width(25)
            Text("联系电话："+this.JDData.phone)
          }
          .width("100%")
          .margin({left:10})
        }
        .width("100%")
    }
    .height('100%')
    .width('100%')
  }
}