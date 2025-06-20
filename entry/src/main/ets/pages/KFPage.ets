import http from '@ohos.net.http'
import { promptAction } from '@kit.ArkUI'
export interface AIdata{
  choices:Choice[]
  usage:Usage
}
export interface Choice{
  index:number
  message:UserData
}
export interface Usage{
  prompt_tokens:number
  completion_tokens:number
  total_tokens:number
}
export interface UserData{
  role:string
  content:string
}
export class  UIdata{
  type:number
  content:string
  constructor(type: number, content: string) {
    this.type = type
    this.content = content
  }
}

let httpReq = http.createHttp()

@Entry
@Component
struct KFPage {
  Cont:string=""
  ReqCont:string=""
  @State ListData : Array<UIdata>=[]
  aboutToAppear(): void {
    httpReq.request("https://api.link-ai.tech/v1/chat/completions",{
      method: http.RequestMethod.POST,
      header:{
        'Content-Type': 'application/json',
        "Authorization": "Bearer Link_SVHmtcLBWdaKSXF9SAfrHDAihRmHMkt50Yuma7p2sb"
      },
      extraData:{
        "app_code": "",
        "messages": [
          {
            "role": "user",
            "content": `你好`
          }
        ]
      }
    }).then((res)=>{
      let Resdata = JSON.parse(res.result.toString()) as AIdata
      this.ReqCont= Resdata.choices[0].message.content
      let inputCont:UIdata = new UIdata(2,this.ReqCont)
      this.ListData.push(inputCont)
    })
  }
  build() {
   Column({space:10}){
     Text("客服")
       .fontSize(30)
     Divider()
     Column(){
       List({space:10}){
         ForEach(this.ListData,(item:UIdata)=>{
           ListItem(){
             Row(){
                Text(item.content)
                  .fontSize(20)
             }
             .backgroundColor(item.type===1?"green":"red")
             .width("70%")
             .padding(5)
             .borderRadius(5)
           }
           .margin(item.type===1?{right:0}:{left:0})
           .width("100%")
         })
       }
       .width("100%")
     }.layoutWeight(1)
     Row({space:10}){
       TextInput({placeholder:"请输入内容",text: $$this.Cont})
         .onChange((val)=>{
           if(val!==""){
             this.Cont = val
           }else {
             promptAction.showToast({
               message:"输入内容为空！"
             })
           }
         })
         .layoutWeight(1)
       Button("发送")
         .onClick(()=>{
           let inputCont:UIdata = new UIdata(1,this.Cont)
           this.ListData.push(inputCont)
           httpReq.request("https://api.link-ai.tech/v1/chat/completions",{
             method: http.RequestMethod.POST,
             header:{
               'Content-Type': 'application/json',
               "Authorization": "Bearer Link_SVHmtcLBWdaKSXF9SAfrHDAihRmHMkt50Yuma7p2sb"
             },
             extraData:{
               "app_code": "",
               "messages": [
                 {
                   "role": "user",
                   "content": `${this.Cont}`
                 }
               ]
             }
           }).then((res)=> {
             let Resdata = JSON.parse(res.result.toString()) as AIdata
             this.ReqCont= Resdata.choices[0].message.content
             let inputCont:UIdata = new UIdata(2,this.ReqCont)
             this.ListData.push(inputCont)
           })
           this.Cont=""
         })
     }
     .padding(10)
     .height(100)
   }
   .width("100%")
   .height("100%")
  }
}