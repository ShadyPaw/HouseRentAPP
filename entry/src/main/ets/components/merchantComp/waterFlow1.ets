import { WaterFlowDataSource } from '../../components/merchantComp/WaterFlowDataSource'
import { router } from '@kit.ArkUI'
import { Good, Type } from '../../modules/GoodItems'

@Component
export struct waterFlow1 {
  @State minSize: number = 180
  @State maxSize: number = 260
  @Link stateClass:boolean
  // private itemWidthArray: number[] = []
  private itemHeightArray: number[] = []
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  // 计算FlowItem宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  // 设置FlowItem的宽/高数组
  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      // this.itemWidthArray.push(this.getSize())
      this.itemHeightArray.push(this.getSize())
    }
  }
  aboutToAppear(): void {
    this.setItemSizeArray()
  }
  build() {

    WaterFlow() {

      LazyForEach(this.dataSource, (item:Good,index: number) => {
        FlowItem() {
          // 热销
          Column({space:10}){
            Image(item.img)
              .width('90%').height('65%')
              .borderRadius(10)
            Text(item.name).width('80%')
            Row(){
              Text('￥'+item.price).fontColor(Color.Red)
              Blank()
              Text('热度值'+item.stock).fontColor('#ffff7801').fontSize(14)
            }
            .width('80%')

          }.width('100%').height('100%')
          .onClick(()=>{
            router.pushUrl({
              url:"pages/ShopPage/GoodDetailsPage"
            })
          })
        }
        // .onAppear(() => {
        //   // 即将触底时提前增加数据，即执行数据预加载
        //   if (index + 5 == this.dataSource.totalCount()) {
        //     for (let i = 0; i < 5; i++) {
        //       this.dataSource.addLastItem({id:4,name:'运动服',stock:576,desc:'',count:0,color:Color.Black,price:234,type:Type.badminton,img:'',mid:0})
        //     }
        //   }
        // })
        .width('100%')
        .height(this.itemHeightArray[index % 100])
        .backgroundColor('#fff6f6f5')
      }, (item: string) => item)


    }
    .columnsTemplate("1fr 1fr")
    .columnsGap(5)
    .rowsGap(5)
    .backgroundColor('#fff')
    .width('100%')
    .height('100%')
  }
}