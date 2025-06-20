import { jock } from '../JockComp'

@Component
export struct JockDetailComp {
  @Prop jockDetail:jock
  build() {
    NavDestination(){
      Column({space:10}){
        Image(this.jockDetail.img)
          .width("95%")
          .height(150)
          .borderRadius(10)
        Text(this.jockDetail.detail)
      }
    }
    .title("个人详情")
  }
}