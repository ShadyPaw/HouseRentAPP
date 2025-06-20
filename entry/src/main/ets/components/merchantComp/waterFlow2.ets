import { WaterFlowDataSource } from '../../components/merchantComp/WaterFlowDataSource'
import { router } from '@kit.ArkUI'
import { Type } from '../../modules/GoodItems'

@Component
export struct waterFlow2 {
  @State minSize: number = 210
  @State maxSize: number = 260
  @Link stateClass:boolean
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  build() {
    WaterFlow() {
      LazyForEach(this.dataSource, (item: number) => {
        FlowItem() {
          // 全部
          Row({space:10}){
            Image('https://tse3-mm.cn.bing.net/th/id/OIP-C.U9BxFcAlw_bue8BnY1UmcAHaE8?w=267&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3')
              .width('35%').height('90%')
              .borderRadius(10)
            Column({space:9}){
              Text(`清水房`).width('100%').fontSize(20)
              Text('让您住的舒心的安心小窝').width('100%')
                .fontColor('#ff7c7c7c')
              Row(){
                Text(`售罄`).fontColor(Color.Red).fontSize(18)
                Blank()
                Text(`无房源`).fontColor('#ffff7801').fontSize(14)
              }.width('100%')
            }.layoutWeight(1)

          }.width('100%').height('100%')
          .padding({left:10,right:10})
          .onClick(()=>{
            router.pushUrl({
              url:"pages/ShopPage/GoodDetailsPage"
            })
          })

        }.onAppear(() => {
          // 即将触底时提前增加数据，即执行数据预加载
          if (item + 5 == this.dataSource.totalCount()) {
            for (let i = 0; i < 10; i++) {
              this.dataSource.addLastItem({id:4,name:'清水房',stock:576,desc:'',count:0,color:Color.Black,price:234,type:Type.badminton,img:'',mid:0})
            }
          }
        })
        .width('100%')
        .height(150)
        .backgroundColor('#fff6f6f5')
      }, (item: string) => item)


    }
    .columnsTemplate("1fr")
    .columnsGap(5)
    .rowsGap(5)
    .padding({left:10,right:10})
    .backgroundColor('#fff')
    .width('100%')
    .height('100%')
  }
}