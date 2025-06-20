import { JockDetailComp } from './components/JockDetailComp'
import { User } from './PHComp'

export class jock {
  img: string
  name: string
  age: string
  detail: string
  type: string

  constructor(img: string, type: string, name: string, age: string, detail: string) {
    this.img = img
    this.type = type
    this.name = name
    this.age = age
    this.detail = detail
  }
}

@Component
export struct JockComp {
  private JockData: jock[] = [
    new jock("https://tse1-mm.cn.bing.net/th/id/OIP-C.gJ0A9SKfOvemkg3Nrb3paAHaE8?w=279&h=186&c=7&r=0&o=7&pid=1.7&rm=3","租房常识", "选址通勤优先原则"," ",
      "租房选地址时，优先考虑通勤时间！若依赖公共交通，选地铁、公交站点步行10分钟内的房源；自驾则关注周边道路拥堵情况，避开早晚高峰必堵路段，能大幅提升生活幸福感，减少通勤疲惫~"),
    new jock("https://tse4-mm.cn.bing.net/th/id/OIP-C.hmitgmT9Y4y9QxgqCtoaGAHaFj?w=248&h=186&c=7&r=0&o=7&pid=1.7&rm=3","租房常识", "验房重点清单"," ",
      "收房验房别马虎！先检查门窗能否正常开关、锁具是否好用；再看水电设施，测试水龙头水流、电路插座通电情况；最后留意墙面、地面有无裂缝、渗水，这些细节关乎后续居住质量，发现问题及时让房东维修~"),
    new jock("https://tse2-mm.cn.bing.net/th/id/OIP-C.JM58AJENXQTpjxviGdnj0gHaFj?w=240&h=180&c=7&r=0&o=7&pid=1.7&rm=3", "租房常识", "合同关键条款"," ",
      "签租房合同要盯紧这些！明确租金金额、支付方式（月付/季付等）、租赁期限；标注房屋维修责任，一般小修租客负责，大修房东承担；还要写清提前解约违约金规则，保障双方权益，避免后续扯皮~"),
    new jock("https://tse4-mm.cn.bing.net/th/id/OIP-C.3OUlb_i7KhzixGpRXOnAxwHaEK?w=329&h=185&c=7&r=0&o=7&pid=1.7&rm=3",  "房源类型", "整租合租咋选"," ",
      "整租 vs 合租怎么挑？整租私密性强、自由度高，但租金压力大；合租平摊费用更省钱，还能认识室友，但要适应共享空间。若爱独处、预算够选整租；想省钱、乐意社交，合租更合适，选室友也别忘看生活习惯是否契合~"),
    new jock("https://tse2-mm.cn.bing.net/th/id/OIP-C.3YpQrOaw3NbL-VSiPgDLZwHaE7?w=268&h=180&c=7&r=0&o=7&pid=1.7&rm=3", "房源类型", "老小区租房优缺"," ",
      "租老小区房子有这些特点！优点是地段通常不错，生活配套成熟，菜市场、便利店近；房租金相对低。缺点是房屋设施老旧，可能存在隔音差、无电梯（楼层高爬着累）问题，看重性价比和生活便利可考虑~"),
    new jock("https://tse4-mm.cn.bing.net/th/id/OIP-C.mLLkd7aRzcbRAVV03-LL7AHaFj?w=257&h=193&c=7&r=0&o=7&pid=1.7&rm=3",  "房源类型", "公寓租房注意"," ",
      "租公寓得留意这些！品牌公寓相对规范，有统一管理、配套设施（如健身房、公区），但部分水电费按商业标准收，成本更高；小公寓要查产权，避免租到违规改建房，同时确认物业费、网络费等附加费用~"),
    new jock("https://tse1-mm.cn.bing.net/th/id/OIP-C.roAXFOpT0F3Mph65A2nw2QHaFj?w=258&h=193&c=7&r=0&o=7&pid=1.7&rm=3",  "避坑指南", "黑中介识别法"," ",
      "防黑中介要会这招！先查中介资质，正规中介有营业执照、备案信息；签合同前别轻信口头承诺，让其写进合同；若要求提前交高额定金、押金且理由含糊，大概率有问题，多对比几家中介，别着急签约。"),
    new jock("https://tse4-mm.cn.bing.net/th/id/OIP-C.tc44KPnmhvl9S1BX_5UFXAHaE7?w=254&h=185&c=7&r=0&o=7&pid=1.7&rm=3",  "避坑指南", "虚假房源辨别"," ",
      "刷租房平台别被假房源骗！若图片超美但租金远低于同地段，十有八九有问题；描述写“房东直租、无中介费”，点进去却让联系中介，很可能是引流。可要求视频看房或约实地看，验证房源真实性~。"),
    new jock("https://tse3-mm.cn.bing.net/th/id/OIP-C.avs7-aTaHMz286DBFCYJAQHaE7?w=258&h=180&c=7&r=0&o=7&pid=1.7&rm=3", "权益维护", "押金退还要点"," ",
      "退房退押金得这么做！退租前提前通知房东，按合同约定打扫房屋、恢复原状（若有改造）；交接时和房东一起检查物品损耗，正常使用损耗别被扣钱；保留好押金收据、缴费凭证，若无故克扣，可凭证据维权~"),
    new jock("https://tse1-mm.cn.bing.net/th/id/OIP-C._iNbKLvC_lOx4LeCX_p6DQAAAA?w=303&h=197&c=7&r=0&o=7&pid=1.7&rm=3",  "权益维护", "合租纠纷处理", " ",
      "合租起纠纷这样解决！和室友先友好协商，比如卫生分工、作息时间，达成一致写简单约定；若涉及房东责任（如设施维修拖延），联合室友一起沟通，保留聊天记录、照片等证据，协商不成可找物业或报警协调 "),
  ]
  pageStack: NavPathStack = new NavPathStack()

  @Builder
  PagesMap(name: string, parse: jock) {
    if (name == 'jockDetail') {
      JockDetailComp({ jockDetail: parse })
    }
  }

  build() {
    Column() {
      Navigation(this.pageStack) {
        List({ space: 10 }) {
          ForEach(this.JockData, (item: jock) => {
            ListItem() {
              Row({ space: 10 }) {
                Image(item.img)
                  .width(80)
                  .height(100)
                  .borderRadius(10)
                Column({ space: 10 }) {
                  Text(item.type)
                    .fontSize(20)
                  Text(item.name)
                  Text(item.age.toString())
                }
                .layoutWeight(1)

                Button("查看更多")
                  .backgroundColor("#ffcf7474")
                  .onClick(() => {
                    this.pageStack.pushPath({ name: "jockDetail", param: item })
                  })
              }.width('100%')
            }
            .width("100%")
            .padding(10)
            .backgroundColor("white")
            .borderRadius(10)
          })
          // ,() => (Math.floor(Math.random()*10000)).toString()

        }
        .width("100%")
        // .height('80')
        .scrollBar(BarState.Off)
        .padding({ right: 10, left: 10 })

      }
      .hideTitleBar(true)
      .navDestination(this.PagesMap)
    }
    .width('100%')
    .height("100%")
  }
}