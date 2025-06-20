// 商品详情页
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {


  build() {
    //详情页
    Column() {
      Stack(){
        //轮播图
        Swiper(){
          Image('https://tse4-mm.cn.bing.net/th/id/OIP-C.hmitgmT9Y4y9QxgqCtoaGAHaFj?w=267&h=201&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3')
            .height('60%')
          Image('https://tse4-mm.cn.bing.net/th/id/OIP-C.BiNfqCW_uJj78H3b-_IzIQHaFk?w=271&h=204&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3')
            .height('60%')
          Image('https://tse2-mm.cn.bing.net/th/id/OIP-C.W7RmMaB-tZmWxh0ej-34cQHaE2?w=279&h=183&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3')
            .height('60%')
        }
        .loop(false)
        //轮播图上方功能
        Row({space:10}){

          Image('/image/向左箭头.svg')
            .width(40)
            .height(40)
            .borderRadius(10)
            .backgroundColor('rgba(1,2,3,0.2)')
            .onClick(()=>{
              router.back()

            })

          Blank()
          Image('/image/分享 2.svg')
            .width(40)
            .height(40)
            .borderRadius(10)
            .backgroundColor('rgba(1,2,3,0.2)')

          Image('/image//cartICON.svg')
            .width(40)
            .height(40)
            .borderRadius(10)
            .backgroundColor('rgba(1,2,3,0.2)')

          Image('/image/更多.svg')
            .width(40)
            .height(40)
            .borderRadius(10)
            .backgroundColor('rgba(1,2,3,0.2)')

        }.width('100%')
        .padding(10)
        .margin({bottom:400})
      }
      //价格侠
      Column(){
        Row(){
          Column(){
            Row(){
              Text('￥')
                .fontColor('#fff')
              Text('2500')
                .fontSize(40)
                .fontColor('#fff')
              Text('元/月·')
                .fontColor('#fff')
            }
            Row({space:5}){
              Text('热度')
                .fontColor('#fff')
              Text('1万+')
                .fontColor('#fff')
            }.padding({bottom:15})
          }.padding({left:10})

          Text('精装修')
            .fontSize(20)
            .padding({right:10})
            .fontColor('#fff')
        }.width('100%')
        .height(70)
        .justifyContent(FlexAlign.SpaceBetween)
        .backgroundColor('#e8229def')
        // .backgroundColor('rgba(6, 7, 6, 0.20)')

      }
      //商品名
      Column(){
        Row(){
          Text('诚心租')
            .fontColor('#fff68630')
            .border({width:0.2,color:'#ffc15208'})
            .borderRadius(3)
          Blank()
          Image('/image/youjiantou.png')
            .width(18)
            .height(18)
        }.width('100%')
        .height(30)
        .padding({left:10,right:10})
        Row({space:6}){
          Text('优质')
            .fontColor('#fffcfcfc')
            .borderRadius(3)
            .backgroundColor('#fff32c0a')
          Text('万科翡翠东第三居室好楼层采光好地铁口')
            .textOverflow({overflow:TextOverflow.Clip})
            .maxLines(3)
            .width('90%')
            .fontSize(20)
        }.width('100%')
        .height(50)
        .padding({left:6})
      }
      Blank()
      //底部加入购物车/点击购买
      Divider().strokeWidth(0.6)
      Row({space:10}){
        Column(){
          Image('/image/dianpu.png')
            .width(25)
            .height(25)
            .borderRadius(10)
          Text('租户')
            .fontSize(13)
        }
        Column(){
          Image('/image/客服 (1).svg')
            .width(25)
            .height(25)
            .borderRadius(10)
          Text('经纪人')
            .fontSize(13)
        }
        Column(){
          Image('/image/shoucang.png')
            .width(25)
            .height(25)
            .borderRadius(10)
          Text('收藏')
            .fontSize(13)
        }

        Row({space:20}){
          Image('/image/cartjia.png')
            .width(37)
            .height(37)
            .padding({left:12})

          Column(){
            Row(){
              Text('￥')
                .fontColor('#fff')
              Text('1500')
                .fontColor('#fff')
              Text('元/月')
                .fontColor('#fff')
            }
            Row({space:8}){
              Text('支付立享分期免息')
                .fontColor('#fff')
              Text('去购买')
                .fontColor('#fff')
            }
          }.padding({left:10})
        }.width('66%')
        .height(50)
        .borderRadius(8)
        .linearGradient({
          angle: 90,
          // colors: [['#ffff8e03', 0.2], ['#e2fd440c', 0.3]]
          colors: [['#ff03ffc4', 0.2], ['#e20fe0af', 0.3]]
        })

      }.width('100%')
      .height(60)
      .padding({left:10})
      .backgroundColor('#ffffffff')


    }
    .height('100%')
    .width('100%')
  }
}