import { promptAction, router } from '@kit.ArkUI'
import { getShopList } from '../../apis/Shop/ShopHttpInstance'
import { Shop } from '../../modules/Shop'
import { contents } from './contents'


@Component
export struct merchants {
  @State shopList: Shop[] = [
    {id :1 ,name:'品质合租',fans:5433,picture:'https://tse4-mm.cn.bing.net/th/id/OIP-C.9r_jXOzF7S7di0jTQvSMgAHaFj?w=217&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3'},
    {id :2 ,name:'精选整租',fans:8675,picture:'https://tse4-mm.cn.bing.net/th/id/OIP-C.mdqcWGFdY_qGTj9YodSfigExDM?w=257&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3'},
    {id :3 ,name:'整栋公寓',fans:12435,picture:'https://tse4-mm.cn.bing.net/th/id/OIP-C.-d-vmJQruZXhUI874CY9IwHaEH?w=278&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3'},
    {id :4 ,name:'灵活短租',fans:9788,picture:'https://tse3-mm.cn.bing.net/th/id/OIP-C.UJPAg6GW2pxl-wp7VR4gEwHaFj?w=238&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3'},
    {id :5 ,name:'留学租房',fans:434,picture:'https://tse2-mm.cn.bing.net/th/id/OIP-C.sfeHxqHDLCXrRC9ngeQJvgHaFX?w=224&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3'},
    {id :6 ,name:'loft公寓',fans:24435,picture:'https://tse2-mm.cn.bing.net/th/id/OIP-C.Up3sIcvtvtA5kwoT0YVGgAHaFN?w=277&h=185&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3'},
    {id :7 ,name:'超绝青年公寓',fans:353456,picture:'https://tse4-mm.cn.bing.net/th/id/OIP-C.acOI0xX8JL9DRQ4r75o-xwAAAA?w=291&h=196&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3'},
  ]

  aboutToAppear(): void {
    // getShopList()
    // this.shopList = AppStorage.get('shopList') as Shop[]
    // AlertDialog.show({
    //   message: `${this.shopList}`
    // })
  }

  build() {
    Column() {
      // 搜索框
      Row() {
        // Image('/image/zuojiantou.png')
        //   .width(35)
        //   .onClick(() => {
        //     router.back()
        //   })

        TextInput({ placeholder: '搜索您的心仪的房屋类型' })
          .layoutWeight(1)
          .backgroundColor(Color.White)
          .padding({ left: 20, top: 5, bottom: 5 })// 内边距
          .borderColor('#ccc')// 边框颜色
          .borderWidth(1) // 边框宽度

        Image('/image/search.png')
          .width(35)
          .margin({ left: 10 })
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#ff8ca5d0') // 背景色

      // 列表
      List({ space: 6 }) {
        ForEach(this.shopList, (item:Shop) => {
          ListItem() {
            contents({Item:item})
          }
          .padding({ right: 10, left: 10 })
          .backgroundColor(Color.White) // 列表项背景色
          .borderRadius(10) // 列表项圆角
        })
      }
      .width('100%')
      .scrollBar(BarState.Off)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f7f7f7') // 整体背景色
  }
}
