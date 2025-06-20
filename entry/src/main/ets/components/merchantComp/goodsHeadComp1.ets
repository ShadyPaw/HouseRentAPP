import { Shop } from '../../modules/Shop';

@Component
export struct goodsHeadComp1 {
  @Link stateClass:boolean
  @State shopItem:Shop = {id:0,name:'',fans:0,picture:'/image/personal_shop.png'};
  build() {
    Column(){
      Row({ space: 10 }) {
        // 头像
        Image(this.shopItem.picture).width(40).borderRadius(10)
        Column() {
          Text(this.shopItem.name).fontColor('#fff').fontSize(20).width(200).fontWeight(FontWeight.Bold)
          Text(`关注度`+ this.shopItem.fans).fontColor('#fff').fontSize(15).width(200)
        }
        Blank()

        Button() {
          Text('+关注').fontColor('#fff').fontWeight(FontWeight.Bold)
        }.padding(5)
        .linearGradient({ angle: 45, colors: [['#ffff8849', 0.0], ['#ffe93305', 1.0]] })
        .onClick(()=>{
          this.shopItem.fans++
        })

      }.width('100%')
      .backgroundColor('#ff8d2919')
      .padding({ top:7,bottom:7,right:15,left:15 })

      Row(){
        Button({stateEffect:false,buttonStyle:ButtonStyleMode.TEXTUAL}){
          Text('热销').fontSize(20).fontColor(this.stateClass? '#fff54c07' : '#ff696565')
            .fontWeight(this.stateClass? FontWeight.Bold : FontWeight.Normal)
        }.margin({left:70})
        .onClick(()=>{
          this.stateClass = true
        })
        Button({stateEffect:false,buttonStyle:ButtonStyleMode.TEXTUAL}){
          Text('全部').fontSize(20).fontColor(this.stateClass?'#ff696565':'#fff54c07')
            .fontWeight(this.stateClass? FontWeight.Normal: FontWeight.Bold)
        }.margin({right:70})
        .onClick(()=>{
          this.stateClass = false
        })
      }.width('100%')
      .borderRadius({topLeft:20,topRight:20})
      .backgroundColor('#fff')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding(15)

    }.width('100%')
    .backgroundColor('#ff8d2919')
  }
}