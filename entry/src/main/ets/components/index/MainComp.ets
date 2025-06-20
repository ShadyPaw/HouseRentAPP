// 主体区域
import { EventsComp } from '../Tabs/EventsComp'
import { GZComp } from '../Tabs/GZComp'
import { JDComp } from '../Tabs/JDComp'
import { JockComp } from '../Tabs/JockComp'
import { PHComp } from '../Tabs/PHComp'
import { videoComp } from '../Tabs/videoComp'
import { ZBComp } from '../Tabs/ZBComp'

@Component
export struct MainComp {
  private TabsList :string[] = ["住房","中介推荐","视频","会员","线下门店","热门房型","小知识"]
  build() {
    Column(){
      Tabs(){
        ForEach(this.TabsList,(item:string)=>{
          TabContent(){
            if(item==="住房"){
              EventsComp()
            }else if(item==="中介推荐"){
              GZComp()
            }
            else if(item==="视频"){
              videoComp()
            }
            else if(item==="会员"){
              ZBComp()
            }
            else if(item==="线下门店"){
              JDComp()
            }
            else if(item==="热门房型"){
              PHComp()
            }
            else if(item==="小知识"){
              JockComp()
            }

          }
          .tabBar(item)
          .width('100%')
          .height('100%')
   
        })
      }
      .width('100%')
      .height('100%')
      .barMode(BarMode.Scrollable)
    }.width('100%')
    .height('100%')
  }
}