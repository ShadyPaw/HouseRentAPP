import { http } from '@kit.NetworkKit';
import { router } from '@kit.ArkUI';

// 实时天气预报类型
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

// 未来天气预报数据结构

interface ResType2 {
  status?: number;
  count?: number;
  info?: string;
  infocode?: number;
  forecasts?: forecast[];
}

interface forecast {
  city?: string;
  adcode?: number;
  province?: string;
  reporttime?: string;
  casts?: casts[];
}

interface casts {
  date: string;
  week: number;
  dayweather: string;
  nightweather: string;
  daytemp: number;
  nighttemp: number;
  daywind: string;
  nightwind: string;
  daypower: string;
  nightpower: string;
  daytemp_float: number;
  nighttemp_float: number;
}


@Entry
@Component
struct weatherPage {
  @State weaLive: ResType = {}
  @State forecast: ResType2 = {}

  aboutToAppear(): void {
    let httpRequest = http.createHttp()
    httpRequest.request('https://restapi.amap.com/v3/weather/weatherInfo?city=500117&key=c5df5df93b77dd0b2f4694adf84875eb',
      (err: Error, data: http.HttpResponse) => {
        if (!err) {
          // console.info(''+ data.result);
          this.weaLive = JSON.parse('' + data.result) as ResType
        } else {
          console.info('error:' + JSON.stringify(err));
          httpRequest.destroy();
        }
      });

    let httpRequest2 = http.createHttp()
      httpRequest2.request('https://restapi.amap.com/v3/weather/weatherInfo?city=500117&extensions=all&key=c5df5df93b77dd0b2f4694adf84875eb',
      (err: Error, data: http.HttpResponse) => {
        if (!err) {
          // console.info(''+ data.result);
          this.forecast = JSON.parse('' + data.result) as ResType2
        } else {
          console.info('error:' + JSON.stringify(err));
          httpRequest.destroy();
        }
      });


  }

  build() {
    Column() {

      Row({ space: 10 }) {
        Image('/image/wearFh.png').width(27)
          .onClick(()=>{
            router.back()
          })
        Blank()
        Image('/image/wearSx.png').width(30)
      }.width('100%')
      .padding(10)
      .height(70)
      .height(65)
      Row() {
        //   定位
        Text(this.weaLive.lives ? this.weaLive.lives[0].province + this.weaLive.lives[0].city : '    ')
          .fontColor(Color.White)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
        Image('/image/wearDw.png').width(30).margin({bottom:3})
      }.width('100%')
      .justifyContent(FlexAlign.Center)
      Row() {
        //   定位
        Text(this.weaLive.lives ? this.weaLive.lives[0].temperature.toString() : '00')
          .fontColor(Color.White)
          .fontSize(90)
          // .fontWeight(FontWeight.Bold)
        Text('℃')
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .fontSize(25)

      }.width('100%')
      .justifyContent(FlexAlign.Center)

      Row(){
        Text(this.weaLive.lives ? this.weaLive.lives[0].weather + ' ' +this.weaLive.lives[0].winddirection+'风' : '     ')
          .fontColor(Color.White)
          // .fontWeight(FontWeight.Bold)
          .fontSize(25)
      }
      Row(){
        Text('今天似乎是个看房的好天气呢')
          .textOverflow({overflow:TextOverflow.MARQUEE})
          .maxLines(1)
          .width('90%')
          .fontColor('#ff3b739b')
          .fontSize(17)
      }.height(30).width('80%')
      .margin({top:25})
      .backgroundColor('#ffdce9e9')
      .borderRadius(15)

      Divider().backgroundColor('#ffdce9e9')
        .margin({top:30})
        .width('80%')
        .height(1)

      Column(){
        ForEach([0,1,2,3],(item:number)=>{

          Row({space:12}){
            Column(){
              Text(this.forecast.forecasts?.[0]?.casts?.[item]?.week ? '周'+ this.forecast.forecasts?.[0]?.casts?.[item]?.week : '  ')
                .fontColor('#fff')
                .fontSize(20)
              Text(this.forecast.forecasts?.[0]?.casts?.[item]?.date ? this.forecast.forecasts[0].casts[item].date.slice(-5) : '  ')
                .fontColor('#fff')
                .fontSize(18)
            }
            // 气温
            Row(){
              Text(this.forecast.forecasts?.[0]?.casts?.[item]?.date ? ''+this.forecast.forecasts[0].casts[item].daytemp+'℃' : '  ')
                .fontColor('#fff')
                .fontSize(22)
              Text(`/`).fontColor('#fff').fontSize(20)
              Text(this.forecast.forecasts?.[0]?.casts?.[item]?.date ? ''+this.forecast.forecasts[0].casts[item].nighttemp+'℃' : '  ')
                .fontColor('#fff')
                .fontSize(22)
            }
            // 天气
            Column(){
              Row(){
                Image('/image/wearTy.png').width(20)
                Text(this.forecast.forecasts?.[0]?.casts?.[item]?.date ? this.forecast.forecasts[0].casts[item].dayweather : '  ')
                  .fontColor('#fff')
                  .fontSize(20)

              }
              Row(){
                Image('/image/wearYl.png').width(20)
                Text(this.forecast.forecasts?.[0]?.casts?.[item]?.date ? this.forecast.forecasts[0].casts[item].nightweather : '  ')
                  .fontColor('#fff')
                  .fontSize(20)
              }
            }
            //   风向和等级
            Column(){
              Text(this.forecast.forecasts?.[0]?.casts?.[item]?.date ? this.forecast.forecasts[0].casts[item].daywind+'风' : '  ')
                .fontColor('#fff')
                .fontSize(20)
              Text(this.forecast.forecasts?.[0]?.casts?.[item]?.date ? this.forecast.forecasts[0].casts[item].daypower+'级' : '  ')
                .fontColor('#fff')
                .fontSize(20)
            }

          }.width('100%')
          .height(75)
          // .backgroundColor('#fff')
          Divider().backgroundColor('#ffdce9e9')
            .width('100%')
            .height(1)

        })



      }.width('95%')
      .margin({top:65})
      .backgroundColor('#ff4a9dae')
      .height('46%')
      .borderRadius(25)
      .padding(10)
      // .linearGradient({angle:100,colors:[["#ff9fd6e2",0.0],["#ff4a9dae",1.0]]})

    }
    .height('100%')
    .width('100%')
    .backgroundColor('#ffa9d1d9')
    .linearGradient({angle:180,colors:[["#ff4a9dae",0.0],["#ffa9d1d9",1.0]]})
  }
}