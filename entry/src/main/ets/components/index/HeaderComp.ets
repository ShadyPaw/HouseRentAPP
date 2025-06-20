// 头部区域
import { http } from '@kit.NetworkKit';
import { promptAction, router } from '@kit.ArkUI';

interface ResType {
  status?: number;
  count?: number;
  info?: string;
  infocode?: number;
  lives?: weaLive[];
}


interface weaLive {
  province: string;
  city: string;
  adcode: number;
  weather: string;
  temperature: number;
  winddirection: string;
  windpower: string;
  humidity: number;
  reporttime: string;
  temperature_float: number;
  humidity_float: number;
}

function GetYears() {
  let today = new Date(); // 获取当前日期和时间
  let year = today.getFullYear(); // 获取当前年份
  let month = today.getMonth() + 1; // 获取当前月份，月份从0开始计数，所以需要+1
  let day = today.getDate(); // 获取当前日期

  month = Number(month < 10 ? '0' + month : month)
  day = Number(day < 10 ? '0' + day : day)
  return year + "-" + month + "-" + day + "";
}

@Component
export struct HeaderComp {
  @State dataResult: ResType = {}

@State change:boolean=false


  @Builder
  ShutdownMenu() {
    Menu() {
      MenuItem({
        startIcon: '/image/关机.svg',
        content: '退出登录',
      }).onClick(() => {
        AppStorage.set("token", '')
        promptAction.showToast({
          message: '您已退出登录！'
        })
      })
    }
  }


  aboutToAppear(): void {
    let httpRequest = http.createHttp()
    httpRequest.request('https://restapi.amap.com/v3/weather/weatherInfo?city=500000&key=c5df5df93b77dd0b2f4694adf84875eb',
      (err: Error, data: http.HttpResponse) => {
        if (!err) {
          // console.info(''+ data.result);
          let d1 = JSON.parse('' + data.result) as ResType
          this.dataResult = d1
        } else {
          console.info('error:' + JSON.stringify(err));
        }

      })
  }

  build() {
    Row({ space: 5 }) {
      Image('/image/myLogoIcon.png')
        .width(65)
        .height(65)
        .padding(5)
      Column() {
        Row({ space: 10 }) {
          Image('/image/天气.svg')
            .width(20)
            .height(20)
          // 天气预报
          if (this.dataResult.lives) {
            Text('' + this.dataResult.lives[0].weather + ' ' + this.dataResult.lives[0].temperature + "℃ " +
            this.dataResult.lives[0].winddirection + '风')
          } else {
            Text('X')
          }
          Text(GetYears())
        }
        .width('100%')
        .height(30)
        .onClick(() => {
          router.pushUrl({
            url: "pages/weatherPage"
          })
        })

        Text('有房住')
          .fontColor('#ff153ea7')
          .fontSize(25)

      }.layoutWeight(1)

      Row({ space: 5 }) {
        Image('/image/箭头_左右切换.svg').width(25).height(25)

          .onClick(()=>{
            this.change=!this.change
          })

        // Image('/image/more.png').width(20).height(20)

        // Image('/image/cServer.png').width(25).height(25)
        Image('/image/更多 (1).svg').width(20).height(20).bindMenu(this.ShutdownMenu())

      }.height(40)

      .padding({ right: 5 })

      // .backgroundColor('#ccc')

    }.width('100%')
    .height(75)
    .linearGradient({
      angle: 45,
      colors:this.change ? [['#dda8f6e0', 0.2], ['#c9fefeff', 0.8]] :  [['#dd7ce1fa', 0.2], ['#c9659cef', 0.8]]
    })
  }
}