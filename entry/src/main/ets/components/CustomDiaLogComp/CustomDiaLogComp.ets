  import { EventData } from '../Tabs/EventsComp'
import { promptAction } from '@kit.ArkUI'

@CustomDialog
@Component
export struct CustomDiaLogComp {
  controller: CustomDialogController
  @StorageLink("data") CusData: EventData[] = []
  private item: EventData = new EventData("", "", "","", "", 0, 0, 0, 0)
  @State text: string = '' /*积分赛名称*/
  @State fightTime: string = '' /*挑战时间*/
  @State selectedDate: Date = new Date("2024-7-27") /*日期选择器选择的时间*/
  @State location: string = '' /*pk地址*/
  @State select: string = ""

  build() {
    Column({ space: 10 }) {
      Row() {
        Text("有房住看房预约").fontColor(Color.Blue).fontSize(20)
        Text("X")
          .backgroundColor(Color.Red)
          .fontSize(20)
          .textAlign(TextAlign.Center)
          .width(30)
          .height(30)
          .borderRadius(15)
          .onClick(() => {
            this.controller.close()
          })
      }
      .padding(10)
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)

      Column({ space: 10 }) {
        Row() {
          Text("房源类型")
            .width("30%")
          Select([
            { value: "整租公寓" },
            { value: "合租单间" },
            { value: "独栋院落" },
            { value: "Loft户型" },
            { value: "老小区公房" },
          ])
            .width("70%")
            .onSelect((index: number, valve: string) => {
              this.select = valve
            })
        }
        .padding(10)

        Row() {
          Text('姓名').width('30%')
          TextInput({ placeholder: "输入您的姓名", text: $$this.text })
            .onChange((val: string) => {
              val = this.text
              if (val === "") {
                promptAction.showToast({
                  message: "姓名不能为空！",
                  bottom: "55%"
                })
              }
            }).width('70%')
        }

        Row() {
          Text('联系电话').width('30%')
          TextInput({ placeholder: "输入您的联系电话", text: $$this.text })
            .onChange((val: string) => {
              val = this.text
              if (val === "") {
                promptAction.showToast({
                  message: "联系电话不能为空！",
                  bottom: "55%"
                })
              }
            }).width('70%')
        }

        Row() {
          Column() {
            Text('预约时间')
            Row() {
              TextInput({ placeholder: '请选择预计看房时间', text: `${this.selectedDate}` }).enabled(false).width('75%')
              Button('选择')
                .width('25%')
                .onClick(() => {
                  DatePickerDialog.show({
                    start: new Date("2024-1-1"),
                    end: new Date("2100-12-31"),
                    selected: this.selectedDate,
                    showTime: true,
                    useMilitaryTime: false,
                    disappearTextStyle: { color: Color.Pink, font: { size: '22fp', weight: FontWeight.Bold } },
                    textStyle: { color: '#ff00ff00', font: { size: '18fp', weight: FontWeight.Normal } },
                    selectedTextStyle: { color: '#ff182431', font: { size: '14fp', weight: FontWeight.Regular } },
                    onDateAccept: (value: Date) => {
                      this.selectedDate = value
                      console.info("DatePickerDialog:onDateAccept()" + value.toString())
                      promptAction.showToast({
                        message: `${this.selectedDate}`
                      })
                    },
                    onCancel: () => {
                      console.info("DatePickerDialog:onCancel()")
                    },
                    onDateChange: (value: Date) => {
                      console.info("DatePickerDialog:onDateChange()" + value.toString())
                    }
                  })
                })
            }
          }
        }

        Row() {
          Text('条件').width('20%')
          TextInput({ placeholder: "近地铁/商圈/学校", text: $$this.location })
            .onChange((val) => {
              this.location = val
              if (this.location === "") {
                promptAction.showToast({
                  message: "该条件不能为空",
                  bottom: "55%"
                })
              }
            }).width('80%')
        }
      }.padding(10)

      Button("提交")
        .width("90%")
        .height(50)
        .onClick(() => {
          promptAction.showToast({
            message: "上传成功！"
          })
          this.controller.close()
        })
    }
    .width("100%")
    .height("100%")
  }
}