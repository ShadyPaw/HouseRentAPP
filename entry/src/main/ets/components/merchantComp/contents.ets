import { router } from '@kit.ArkUI'
import { Shop } from '../../modules/Shop';

@Component
export struct contents {
  @State Item:Shop = {id:0,name:'',fans:0,picture:'/image/personal_shop.png'};
  @State pic:string[] =[
    'https://tse1-mm.cn.bing.net/th/id/OIP-C.jqCqjhRgC84GzDvK3JReowHaE1?w=291&h=190&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    'https://tse2-mm.cn.bing.net/th/id/OIP-C.ccqqdW_krSYuiNQYhvsNzgHaEn?w=305&h=190&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    'https://tse2-mm.cn.bing.net/th/id/OIP-C.lz4GXyUDAA_gPpkCvZVAVQHaE8?w=286&h=190&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    'https://tse4-mm.cn.bing.net/th/id/OIP-C.Z6BkHnQ4DKOrQkpQ1Lt5xQHaFj?w=240&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    'https://tse4-mm.cn.bing.net/th/id/OIP-C.ZpjZPzCukKFwKqodxNkjgQHaEn?w=278&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
  ]
  build() {
    Column({space:10}) {
      Row() {
        //   头像
        Image(this.Item.picture).width(50).borderRadius(25)
        //   文字
        Column() {
          Text(this.Item.name).width('100%').fontWeight(FontWeight.Bold)
          Text('关注度：'+this.Item.fans).width('100%').fontColor('#ff454545')
        }.layoutWeight(1)
        .margin({ left: 10 })

        //   按钮
        Button({ type: ButtonType.Normal}) {
          Text('查看').fontColor('#ffffffff').onClick(() => {
            router.pushUrl({
              url: "pages/ShopPage/GoodsPage",
              params:this.Item
            })
          })
        }
        .padding({
          left: 10,
          right: 10,
          top: 5,
          bottom: 5
        })
        .linearGradient({
          angle: 45,
          colors: [['#fff3e708', 0.1], ['#ffff7700', 1.0]]
        })
        // .backgroundColor('#ffff7700')
        .borderRadius(10)
      }.width('100%')

      List({ space: 10 }) {
        ForEach(this.pic, (item:string) => {
          ListItem() {
            Image(item).width(85)
          }
        })
      }
      .scrollBar(BarState.Off)
      .listDirection(Axis.Horizontal)
      .borderRadius(10)
      .width('100%')
      .height(90)

    }.width('100%')
    .borderRadius(10)
    .padding(10)
    // .backgroundColor('#F9F9F9')
  }
}