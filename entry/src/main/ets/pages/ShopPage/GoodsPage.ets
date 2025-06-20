import { goodsHeadComp } from '../../components/merchantComp/goodsHeadComp'
import { goodsHeadComp1 } from '../../components/merchantComp/goodsHeadComp1'
import { waterFlow1 } from '../../components/merchantComp/waterFlow1'
import { waterFlow2 } from '../../components/merchantComp/waterFlow2'
import { Shop } from '../../modules/Shop'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct GoodsPage {
  @State Goods:string[] = []
  @State stateClass:boolean = true
  @State shopItem:Shop = {id:0,name:'',fans:0,picture:'/image/personal_shop.png'};
  @Builder
  HeadCompBuild1() {
    goodsHeadComp()
  }
  @Builder
  HeadCompBuild2() {
    goodsHeadComp1({stateClass:this.stateClass,shopItem:this.shopItem})
  }
  aboutToAppear(): void {
    this.shopItem = router.getParams() as Shop
  }
  build() {

    // 商品列表页
    Column() {
      List() {
        ListItemGroup({ header: this.HeadCompBuild1() }) {
          //   头部 返回按钮 搜索框 更多 上划隐藏
        }
          //   店家 头像 店名 热销和全部 上划停滞
        ListItemGroup({header:this.HeadCompBuild2()}) {
          ListItem() {
            if(this.stateClass){
              waterFlow1({stateClass:this.stateClass})
            }else{
              waterFlow2({stateClass:this.stateClass})
            }

          }


        }
      }.sticky(StickyStyle.Header)
      .scrollBar(BarState.Off)
      .height('100%')
      .width('100%')

    }
    .backgroundColor('#ff8d2919')
    .height('100%')
    .width('100%')

  }
}