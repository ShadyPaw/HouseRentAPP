// 收藏页
import { ButtomComp } from '../components/ButtomComp'
import { LoveDetailsComp } from '../components/CollectComp/LoveDetailsComp'

@Entry
@Component
struct CollectPage {
  build() {
    Column() {
      LoveDetailsComp().layoutWeight(1)
      ButtomComp({page:2})
    }
    .height('100%')
    .width('100%')
  }
}