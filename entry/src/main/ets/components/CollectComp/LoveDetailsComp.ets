import { Good, Type } from '../../modules/GoodItems'
import { router } from '@kit.ArkUI'

@Component
export struct LoveDetailsComp {
  @State LoveList: Good[] = [
  //   id: number /*编号*/
  // name: string
  // img: string | Resource
  // stock: number
  // price: number
  // desc: string
  // count: number
  // type: Type
  // color: Color
  // mid: number
    {
      id: 1,
      name: '万科翡翠东第三居室',
      img: 'https://pic1.ajkimg.com/display/anjuke/90d3b5eb5acb1773278f8d8d1e1b25bc/600x450c.jpg?t=1&srotate=1',
      stock: 200,
      price: 20,
      desc: '房子1',
      count: 12,
      type: Type.badminton,
      color: Color.Green,
      mid:100
    },
    {
      id: 2,
      name: '万科翡翠东第二三居室',
      img: 'https://pic1.ajkimg.com/display/anjuke/8d4aaeb70cf9c543ff23a23077a1ac99/600x450c.jpg?t=1&srotate=1',
      stock: 121,
      price: 145,
      desc: '房子2',
      count: 12,
      type: Type.football,
      color: Color.Green,
      mid:100
    },
    {
      id: 3,
      name: '万科翡翠东第三居室',
      img: 'https://pic1.ajkimg.com/display/anjuke/cfa0838078093b6765e7359cc8be6376/600x450c.jpg?t=1&srotate=1',
      stock: 453,
      price: 36,
      desc: '房子3',
      count: 12,
      type: Type.general,
      color: Color.Green,
      mid:100
    },
    {
      id: 4,
      name: '学府公园八一省府街房',
      img: 'https://pic1.ajkimg.com/display/anjuke/9d6bcacae5b3bbc6957c1549833e64e1/600x450c.jpg?t=1&srotate=1',
      stock: 345,
      price: 156,
      desc: '房子4',
      count: 12,
      type: Type.basketball,
      color: Color.Green,
      mid:100
    },
  ] /*收藏列表*/
  @Builder endList(index:number){
      Button("×",{type:ButtonType.Circle})
        .fontSize(30)
        .backgroundColor("red")
        .onClick(()=>{
          this.LoveList.splice(index,1)
        })
  }
  build() {
    Column() {
      // 标题
      // 分隔线
      Divider()
        .color(Color.Red)
        .height(2)// 增加分隔线的高度
        .margin({ bottom: 15 }); // 增加底部间距

      // 列表
      List() {
        ForEach(this.LoveList, (item: Good, index: number) => {
          ListItem() {
            Row({space:5}) {
              // 商品图片
              Column() {
                Image(item.img)
                  .width(80)
                  .height(80)
                  .borderRadius(10)
              }

              // 商品信息
              Column() {
                Text(item.name)
                  .fontSize(18)
                  .fontColor('#333')
                  .margin({ bottom: 5 });

                Row() {
                  Text(`${item.price}元/月`)
                    .fontSize(16)
                    .fontColor('#FF5722');

                  Text()
                    .fontSize(16)
                    .fontColor('#666');
                }

                // 商品分类
                Row() {
                  Text()
                    .fontSize(14)
                    .fontColor('#999');
                }
              }

              // 购买按钮
              Button('前往查看')
                .onClick(() => {
                  router.pushUrl({url:"pages/ShopPage/GoodDetailsPage"})

                })
                .backgroundColor('#4CAF50')
                .borderRadius(5)
                .padding({
                  top: 5,
                  bottom: 5,
                  left: 10,
                  right: 10
                })
                .margin({ left: 10 });
            }
            .padding({ top: 10, bottom: 10 })
            .backgroundColor('#F9F9F9')
            .borderRadius(10)
            .margin({ bottom: 10 });
          }.width('100%')
          .swipeAction({
            end:{
              builder:()=>{this.endList(index)}
            }
          })
        });
      }.layoutWeight(1)
      .scrollBar(BarState.Off)
    }

  }
}