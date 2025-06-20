import { router } from '@kit.ArkUI'

export class JDBean{
  img:string
  name:string
  address:string
  phone:string
  detail:string
  detailimg:string[]

  constructor(img: string, name: string, address: string, phone: string, detail: string, detailimg: string[]) {
    this.img = img
    this.name = name
    this.address = address
    this.phone = phone
    this.detail = detail
    this.detailimg = detailimg
  }
}
@Component
export struct JDComp {
  @State JDList:JDBean[]=[
    new JDBean("https://tse2-mm.cn.bing.net/th/id/OIP-C.GpDLHEIovu-6h6HxAdA2qgHaEq?w=262&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3","链家线下门店1","重庆市合川区","023-2624867",
      "‌链家线下店，布局合理环境优，提供房产交易一站式服务。‌"
      ,["https://tse3-mm.cn.bing.net/th/id/OIP-C.WJi7tzFA7OYYMDtp0x-s0QHaEH?w=301&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3","https://tse2-mm.cn.bing.net/th/id/OIP-C.8ogBVcfAcIPwI2XQuiOxGQHaEK?w=297&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3"
        ,"https://tse1-mm.cn.bing.net/th/id/OIP-C.JMdoo_-LPFwMdEbh2JKKqAAAAA?w=251&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3"]),
    new JDBean("https://tse3-mm.cn.bing.net/th/id/OIP-C.Sjo97fg75UCSv3jK0fS61gHaFj?w=240&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3","链家线下门店2","重庆市合川区","023-1234857",
      "‌链家门店服务全，免费打印借伞等，社区便民超贴心‌"
      ,["https://tse3-mm.cn.bing.net/th/id/OIP-C.WJi7tzFA7OYYMDtp0x-s0QHaEH?w=301&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3","https://tse2-mm.cn.bing.net/th/id/OIP-C.8ogBVcfAcIPwI2XQuiOxGQHaEK?w=297&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3"
        ,"https://tse1-mm.cn.bing.net/th/id/OIP-C.JMdoo_-LPFwMdEbh2JKKqAAAAA?w=251&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3"]),
    new JDBean("https://tse1-mm.cn.bing.net/th/id/OIP-C.p2Gv5GpRXvYeptB0YaRvaQHaFF?w=268&h=184&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3","链家线下门店3","重庆市合川区","023-6546557",
      "‌走进链家线下店，专业经纪人相伴，帮您找到理想家园。‌"
      ,["https://tse3-mm.cn.bing.net/th/id/OIP-C.WJi7tzFA7OYYMDtp0x-s0QHaEH?w=301&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3","https://tse2-mm.cn.bing.net/th/id/OIP-C.8ogBVcfAcIPwI2XQuiOxGQHaEK?w=297&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3"
        ,"https://tse1-mm.cn.bing.net/th/id/OIP-C.JMdoo_-LPFwMdEbh2JKKqAAAAA?w=251&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3"]),
    new JDBean("https://tse1-mm.cn.bing.net/th/id/OIP-C.3BSjZzMJXy6mcB0Z1I6bSgHaFi?w=222&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3","链家线下门店4","重庆市合川区","023-1288903",
      "‌链家 5.0 门店升级，空间宽敞功能多，体验再度大提升‌"
      ,["https://tse3-mm.cn.bing.net/th/id/OIP-C.WJi7tzFA7OYYMDtp0x-s0QHaEH?w=301&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3","https://tse2-mm.cn.bing.net/th/id/OIP-C.8ogBVcfAcIPwI2XQuiOxGQHaEK?w=297&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3"
        ,"https://tse1-mm.cn.bing.net/th/id/OIP-C.JMdoo_-LPFwMdEbh2JKKqAAAAA?w=251&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3"]),
    new JDBean("https://tse4-mm.cn.bing.net/th/id/OIP-C.83zJB8TW_hDCc8WWGs2uYgHaFj?w=222&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3","链家线下门店5","重庆市合川区","023-6424447",
      "‌链家店如城市脉络，夜晚亮灯暖人心，随时为您解烦忧‌"
      ,["https://tse3-mm.cn.bing.net/th/id/OIP-C.WJi7tzFA7OYYMDtp0x-s0QHaEH?w=301&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3","https://tse2-mm.cn.bing.net/th/id/OIP-C.8ogBVcfAcIPwI2XQuiOxGQHaEK?w=297&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3"
        ,"https://tse1-mm.cn.bing.net/th/id/OIP-C.JMdoo_-LPFwMdEbh2JKKqAAAAA?w=251&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3"]),
  ]
  build() {
    Column(){
      List({space:10}){
        ForEach(this.JDList,(item:JDBean)=>{
          ListItem(){
            Row({space:10}){
              Image(item.img)
                .width(80)
                .height("100%")
                .borderRadius(5)

              Column({space:20}){
                Text(item.name)
                Text("地址："+item.address)
              }
            }
            .onClick(()=>{
              router.pushUrl({
                url:"pages/JDPage",
                params:item
              })
            })
            .padding(1)
            .width("100%")
          }

          .padding(5)
          .backgroundColor("white")
          .width("100%")
          .height(120)
          .borderRadius(10)
        })
      }
      .scrollBar(BarState.Off)
    }
  }
}