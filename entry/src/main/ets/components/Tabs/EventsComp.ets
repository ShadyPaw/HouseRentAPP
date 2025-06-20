// 主体区域
import { DividerTmp } from '../../modules/Attention'

export class EventData{
  type:string
  img:string
  title:string
  time:string
  address:string
  liulang:number
  dianzan:number
  pinlun:number
  soucang:number

  constructor(type:string,img: string, title: string, time: string, address: string, liulang: number, dianzan: number,
    pinlun: number, soucang: number) {
    this.type = type
    this.img = img
    this.title = title
    this.time = time
    this.address = address
    this.liulang = liulang
    this.dianzan = dianzan
    this.pinlun = pinlun
    this.soucang = soucang
  }
}
@Component
export struct EventsComp {
  private EnventList : string[] = ["整租公寓","合租单间","Loft户型","小区公房","近商圈地铁学校"]
  @State DataList : EventData[] =[
    new EventData("整租公寓","https://pic1.ajkimg.com/display/anjuke/f53753a78d0cee993c9a2c79fef59feb/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",333,22,18,23),
    new EventData("整租公寓","https://pic1.ajkimg.com/display/anjuke/376b2501a2f4d4bd5b57d584fee0cd14/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",333,22,40,40),
    new EventData("整租公寓","https://pic1.ajkimg.com/display/anjuke/480b1610f557678e5a1ff13c60396142/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",333,22,40,40),
    new EventData("整租公寓","https://pic1.ajkimg.com/display/anjuke/00ecc5deaad8a2d0701217c2ad9514a4/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",333,22,40,40),
    new EventData("合租单间","https://pic1.ajkimg.com/display/anjuke/fc4715da01448b8553f3f19ba50d0921/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",333,22,18,23),
    new EventData("合租单间","https://pic1.ajkimg.com/display/anjuke/d22a535a60bc3608117fa7a564b71c0f/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",333,22,18,23),
    new EventData("合租单间","https://pic1.ajkimg.com/display/anjuke/70d786c6eba185dc5dbae5b08ef100ef/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",333,22,18,23),
    new EventData("合租单间","https://pic1.ajkimg.com/display/anjuke/f5836738d0bcb89ef64a98577d46c809/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",123,22,18,23),
    new EventData("Loft户型","https://pic1.ajkimg.com/display/anjuke/829f46b918cff7ab8b0b93d4d8862858/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",123,22,18,23),
    new EventData("Loft户型","https://pic1.ajkimg.com/display/anjuke/3360036a761f8f687f86d55ecf8796ef/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",123,22,18,23),
    new EventData("Loft户型","https://pic1.ajkimg.com/display/anjuke/387dbb03ce8295ccbc1a95489ed07f7a/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","27㎡",333,22,18,23),
    new EventData("Loft户型","https://pic1.ajkimg.com/display/anjuke/fc41915d369f817ae9205c7196a640a5/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","27㎡",333,22,18,23),
    new EventData("Loft户型","https://pic1.ajkimg.com/display/anjuke/1dcee81133e64500e47847ade063cc39/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","27㎡",333,22,18,23),
    new EventData("小区公房","https://pic1.ajkimg.com/display/anjuke/52a88dad4652e1db90a94b27ac1b220f/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","27㎡",333,22,18,23),
    new EventData("小区公房","https://pic1.ajkimg.com/display/anjuke/00ecc5deaad8a2d0701217c2ad9514a4/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","27㎡",333,22,18,23),
    new EventData("小区公房","https://pic1.ajkimg.com/display/anjuke/f53753a78d0cee993c9a2c79fef59feb/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","27㎡",333,22,18,23),
    new EventData("小区公房","https://pic1.ajkimg.com/display/anjuke/829f46b918cff7ab8b0b93d4d8862858/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","27㎡",333,22,18,23),
    new EventData("近商圈地铁学校","https://pic1.ajkimg.com/display/anjuke/829f46b918cff7ab8b0b93d4d8862858/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",123,22,18,23),
    new EventData("近商圈地铁学校","https://pic1.ajkimg.com/display/anjuke/3360036a761f8f687f86d55ecf8796ef/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",123,22,18,23),
    new EventData("近商圈地铁学校","https://pic1.ajkimg.com/display/anjuke/387dbb03ce8295ccbc1a95489ed07f7a/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","27㎡",333,22,18,23),
    new EventData("近商圈地铁学校","https://pic1.ajkimg.com/display/anjuke/fc41915d369f817ae9205c7196a640a5/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","27㎡",333,22,18,23),
    new EventData("独栋别墅","https://pic1.ajkimg.com/display/anjuke/829f46b918cff7ab8b0b93d4d8862858/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",123,22,18,23),
    new EventData("独栋别墅","https://pic1.ajkimg.com/display/anjuke/3360036a761f8f687f86d55ecf8796ef/600x450c.jpg?t=1&srotate=1","优质大床房","2000元/月","22㎡",123,22,18,23),
  ]
  @State egDivider: DividerTmp = new DividerTmp(1, 70, 10, '#ffe9f0f0')
  @State SelectedList : EventData[] = []
  @State currentIndex :string = "整租公寓"
  aboutToAppear(): void {
    AppStorage.setOrCreate("data",this.DataList)
    for(let i=0;i<this.DataList.length;i++){
      if(this.DataList[i].type==="整租公寓"){
        this.SelectedList.push(this.DataList[i])
      }
    }
  }
  build() {
    Row({space:10}) {
      Column() {
        List({space:10}) {
          ForEach(this.EnventList,(item1:string)=>{
            ListItem(){
              Text(item1)
                .fontSize(15)
                .width("100%")
                .height(40)
                .textAlign(TextAlign.Center)
                .border({
                  width:{left:1,bottom:3,right:0.6},
                  color:{left:this.currentIndex===item1 ? '#ff1f76f8' : '#ccc',bottom:this.currentIndex===item1 ? '#ff1f76f8' : '#ccc',right:'#ccc'},
                  style:{
                    left:BorderStyle.Dashed
                  }
                })
                .animation({duration:200})
                .onClick(()=>{
                  this.currentIndex = item1
                  while(this.SelectedList.length>0){
                    this.SelectedList.pop()
                  }
                  for(let i=0;i<this.DataList.length;i++){
                    if(this.DataList[i].type===item1){
                      this.SelectedList.push(this.DataList[i])
                    }
                  }
                })
            }
          })
        }.padding({left:6})
      }
      .height("100%")
      .width("25%")
      .backgroundColor("white")
      Column() {
        List({space:10}) {
          if(this.SelectedList.length === 0){
            ListItem(){
              Column({space:10}){
                Image("image/empty.png")
                  .width(100)
                Text("暂无房源！")
                  .padding({left:20})
                  .fontSize(25)
                  .fontColor("#ffa4a2a2")
              }.padding({left:50})
            }
            .height("100%")
            .borderRadius(10)
            .backgroundColor("white")
          }else{
            ForEach(this.SelectedList,(item2:EventData)=>{
              ListItem(){
                Row({space:10}){
                  Image(item2.img)
                    .height("95%")
                    .width(75)
                    .border({width:2})
                    .borderRadius(3)
                  Column({space:10}){
                    Text(item2.title)
                      .fontSize(17)
                      .textAlign(TextAlign.Start)
                      .width("100%")
                      .textAlign(TextAlign.Start)
                    Text("价格："+ item2.time)
                      .fontSize(17)
                      .textAlign(TextAlign.Start)
                      .width("100%")
                      .textAlign(TextAlign.Start)
                    Text("面积："+item2.address)
                      .fontSize(12)
                      .textAlign(TextAlign.Start)
                      .width("100%")
                      .textAlign(TextAlign.Start)
                    Text("热度:"+item2.liulang+"  收藏:"+item2.dianzan+"  评论:"+item2.pinlun+"  转发"+item2.soucang)
                      .fontSize(9)
                      .width("100%")
                      .maxLines(1)
                      .textOverflow({
                        overflow:TextOverflow.Ellipsis
                      })
                  }
                }
                .width("70%")
                .height(120)
                .backgroundColor('#fff')
                .borderRadius(5)
              }
            })
          }

        }.divider(this.egDivider)
      }
      .height("100%")
    }
    .height("100%")
  }
}