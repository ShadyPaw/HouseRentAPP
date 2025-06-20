import { information } from '../../modules/User';
import { router } from '@kit.ArkUI';

@Component
export struct InformationComp {
  @State infomationList: information[] = [
  // 个人中心菜单栏
    { image: '/image/个人信息_o.svg', title: '个人信息管理', routerUrl: '' },
    { image: '/image/积分.svg', title: '优惠积分', routerUrl: '' },
    { image: '/image/浏览记录.svg', title: '足迹', routerUrl: '' },
    { image: '/image/预约.svg', title: '预约订单', routerUrl: '' },
    { image: '/image/icon_pk.svg', title: '价格对比', routerUrl: '' },
    { image: '/image/详细.svg', title: '更多详情', routerUrl: '' },
    { image: '/image/地址.svg', title: '我的地址', routerUrl: '' }
  ]

  build() {
    Column() {
      List() {
        ForEach(this.infomationList, (item: information, index: number) => {
          ListItem() {
            Row() {
              Image(item.image).width(30).height(20).padding({ left: 10 })
              Text(item.title)
                .textAlign(TextAlign.Start)
                .fontSize(16)
                .fontColor('#333')
                .width('80%')
                .padding({ left: 20 })
              Image('/image/personal_arrows.png')
                .width(20)
                .height(25)
                .margin({ left: 5 })
                .onClick(() => {
                  router.pushUrl({
                    url: item.routerUrl
                  })
                })
            }
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({ top: 10, bottom: 10, right: 10 })
            .backgroundColor('#fff')
            .borderRadius(6)
          }
          .borderWidth(0)
          .height(50)
          .width('100%')
          .margin({ bottom: 10 })
        }, (item: string) => {
          return item;
        });
      }.scrollBar(BarState.Off)
    }
  }
}