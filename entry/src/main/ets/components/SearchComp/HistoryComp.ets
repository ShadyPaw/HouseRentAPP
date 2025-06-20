// 头部搜索区域
import { promptAction, router } from '@kit.ArkUI'
import { loginComponentManager } from '@kit.AccountKit'

@Styles
function TextStyle() {
  .backgroundColor("#a2a3ff")
  .width(50)
  .height(20)
}

@Component
export struct HistoryComp {
  @State text: string = '' /*输入框内容*/
  @State historyList: string[] = ['无敌好房子', '近地铁短租','离学校近','商圈附近的房子'] /*历史记录*/
  @State isEditing: boolean = false
  scroller: Scroller = new Scroller()
  @State service: Array<string> = ['该功能开发中', '该功能开发中', '该功能开发中', '该功能开发中', '该功能开发中', '该功能开发中', '该功能开发中', '该功能开发中']

  @Styles
  inputStyle(){
    .padding({ left: 10, right: 10 })
    .borderRadius(8)
    .borderColor('#ddd')
    .borderWidth(1)
    .backgroundColor('#fff')
  }

  build() {
    Column() {
      Row() {
        TextInput({ placeholder: '请输入', text: $$this.text }).width('80%').inputStyle()
        Image('/image/搜索.svg').width(30).height(30).padding({ left: 5 }).onClick(() => {
          // 搜索记录+1
          if(this.text.trim()!==''){
            this.historyList.push(this.text)
            this.text = ''
          }
        })
        Image('/image/返回.svg').padding({ left: 10 }).width(35).height(35).onClick(() => {
          // 返回上一页
          router.back()
        })
      }
      .padding({ left: 10, right: 10 })
      .margin({ top: 10, bottom: 10 })
      .borderRadius(10)
      .backgroundColor('#f5f5f5')
      .width('100%')

      Column() {
        Row() {
          Row() {
            Text('历史记录')
              .borderRadius(5)
              .TextStyle()
              .fontColor('#e4ecf8')
              .backgroundColor("#ff8fb6ca")
              .width(100)
              .height(30)
              .textAlign(TextAlign.Center)
            Row({ space: 5 }) {
              Text('编辑')
                .TextStyle().fontColor('#e4ecf8')
                .textAlign(TextAlign.Center)
                .onClick(() => {
                  this.isEditing = !this.isEditing
                  if(this.isEditing){
                    promptAction.showToast({
                      message: '已进入编辑模式,长按历史记录可删除。'
                    })
                  }else{
                    promptAction.showToast({
                      message: '已退出编辑模式。'
                    })
                  }

                })
              Text('清空')
                .borderRadius(5)
                .TextStyle()
                .fontColor('#e4ecf8')
                .textAlign(TextAlign.Center)
                .onClick(() => {
                  this.historyList = []
                })
            }.justifyContent(FlexAlign.End).padding({ top: 10 })
          }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        }

        Row({ space: 10 }) {
          Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
            ForEach(this.historyList, (item: string, index: number) => {
              Text(item)
                .width('27%')
                .height(27)
                .maxLines(1)
                .textOverflow({overflow:TextOverflow.Ellipsis})
                .backgroundColor('#fff5f5f5')
                .borderRadius(10)
                .margin({
                  left: 10,
                  right: 10,
                  bottom: 5,
                  top: 5
                })
                .textAlign(TextAlign.Center)
                .gesture(
                  LongPressGesture({ repeat: true })
                    .onAction((event: GestureEvent) => {
                      // 长按时的逻辑

                    })
                    .onActionEnd((event: GestureEvent) => {
                      if(this.isEditing){
                        this.historyList.splice(index, 1)
                      }
                    })
                )
            })
          }
          .width('100%')
          .backgroundColor("#87CEEB")
          .padding(10)
          .height(200)
          .borderRadius(10)
        }.padding(5)
      }

      Column() {
        Row() {
          Text('猜你喜欢')
            .fontColor("#e4ecf8")
            .backgroundColor("#ff8fb6ca")
            .borderRadius(5)
            .padding({
              left: 12,
              right: 12,
              top: 3,
              bottom: 3
            })
        }.width('100%')
        .padding({ left: 3, bottom: 3 })
      }.width('100%')
      .backgroundColor('#e9d7d3d3')

      Column() {
        Grid() {
          ForEach(this.service, (service: string) => {
            GridItem() {
              Text(service)
            }
            .width('45%')
            .height(180)
            .borderRadius(10)
            .backgroundColor('#fff')
          }, (service: string): string => service)
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .friction(0.6)
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .width('100%')
        .padding(10)
        // .backgroundColor(Color.Orange)
        // .height(500)
        .borderRadius(10)
        .scrollBar(BarState.Off)
        .layoutWeight(1)
      }
      .layoutWeight(1)
    }.backgroundColor('#e9d7d3d3')
    .width('100%')
    .layoutWeight(1)
    .padding(10)
  }
}
