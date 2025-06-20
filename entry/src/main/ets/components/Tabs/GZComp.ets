import { Attention, DividerTmp } from '../../modules/Attention'
import { promptAction } from '@kit.ArkUI'


@Component
export struct GZComp {
  @State egDivider: DividerTmp = new DividerTmp(1, 60, 10, '#ffe9f0f0')
  @State MajorList:Attention[]=[
    new Attention('https://ts2.tc.mm.bing.net/th/id/OIP-C.OwRYbg-uc932qS6yeY2XqQHaEo?w=298&h=186&c=10&rs=1&bgcl=fffffe&r=0&o=6&dpr=1.3&pid=23.1','王大锤','七年从业经验',45,false),
   new Attention('https://ts1.tc.mm.bing.net/th/id/OIP-C.gLp354rVHDLKosjyUxBaPQHaQC?w=120&h=185&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2','张伟','金牌房产中介人',72,false),
   new Attention('https://ts2.tc.mm.bing.net/th/id/OIP-C.TxE8HwkDcNJP9K4bP6zfFgHaIh?w=312&h=200&c=12&rs=1&o=6&dpr=1.3&pid=23.1','理塘丁真','三年两冠中介人',173,false),
   new Attention('https://ts1.tc.mm.bing.net/th/id/OIP-C.v2eD7vQ6ycN4d_f-6wPdjwHaQC?w=120&h=185&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2','张伟2号','银牌房产中介人',24,false),
   new Attention('https://ts1.tc.mm.bing.net/th/id/OIP-C.HVixXO9UvFIawPsuP3yjIQHaQC?w=120&h=185&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2','张伟3号','铜牌房产中介人',75,false),
    new Attention('https://ts1.tc.mm.bing.net/th/id/OIP-C.q-K1ONG53X_W8mBpz9jB8gHaNK?w=120&h=185&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2','张伟4号','铁牌房产中介人',45,false),
    ]
  @State arr1:boolean[] = []
  private Dialog:number = 0
  @Builder customDialogComponent(chang:boolean,index:number,item:Attention){
    Column(){
      Text(!chang ? '确认关注？' : '确认取消关注？').fontSize(20).fontColor('#fffd0303')
      Row({space:50}){
        Button('确认')
          .fontColor('#ff070707')
          .backgroundColor('#fff')
          .onClick(()=>{
            promptAction.closeCustomDialog(this.Dialog)
            item.attontion = !item.attontion
            this.arr1[index] = item.attontion
          })
        Button('取消')
          .fontColor('#ff070707')
          .backgroundColor('#fff')
          .onClick(()=>{
            promptAction.closeCustomDialog(this.Dialog)
          })
      }
    }.height(150).padding(5)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
  aboutToAppear(): void {
    for(let i =0;i<this.MajorList.length;i++){
      this.arr1.push(this.MajorList[i].attontion)
    }
  }
  build() {
    Column(){
      List(){
        ForEach(this.MajorList,(item:Attention,index:number)=>{
          ListItem(){
            Column(){
              Row({space:20}){
                Image(item.src)
                  .width(60)
                  .height(60)
                  .borderRadius(50)
                Column(){
                  Text(item.name)
                  Text(item.major)
                    .fontSize(12)
                  Text('成交数： '+ item.num + '单')
                    .fontSize(12)
                    .fontWeight(FontWeight.Lighter)
                }.alignItems(HorizontalAlign.Start)

                Blank()

                Button(!this.arr1[index] ? '关注' : '√ 已关注')
                  .fontSize(15)
                  .fontColor(!this.arr1[index] ? "red":'#ccc')
                  .border({width:1,color:!this.arr1[index] ? "red":'#ccc'})
                  .backgroundColor('#fff')
                  .type(ButtonType.Capsule)
                  .onClick(()=>{

                    promptAction.openCustomDialog({
                      builder:()=>{
                        this.customDialogComponent(this.arr1[index] ,index,item)
                      },
                      showInSubWindow:false,
                      offset:{dx:0,dy:0 },
                      backgroundColor:'#fff',
                      cornerRadius:15,
                      borderStyle:BorderStyle.Solid,
                      borderColor:Color.Gray,
                      autoCancel:false,
                      shadow:({
                        radius:50,
                        color:Color.Gray,
                        offsetX:16,
                        offsetY:0

                      }),

                      // onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                      //   console.info("reason" + JSON.stringify(dismissDialogAction.reason))
                      //   console.log("dialog onWillDismiss")
                      //   if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                      //     dismissDialogAction.dismiss()
                      //   }
                      //   if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                      //     dismissDialogAction.dismiss()
                      //   }
                      // }
                    }).then((dialogId:number)=>{
                      this.Dialog=dialogId
                    })
                    // item.attontion = !item.attontion
                    // this.arr1[index] = item.attontion
                  })

              }.width('100%')
              .height(70)
              .padding({left:10,right:10})
              .backgroundColor('#fff')
            }

          }
        })
      }
     .divider(this.egDivider)

    }
  }
}