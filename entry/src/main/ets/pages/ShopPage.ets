  // 商家页
import { ButtomComp } from '../components/ButtomComp';
import { merchants } from '../components/merchantComp/merchants';

@Entry
@Component
struct ShopPage {

  build() {
    Column() {
      merchants().layoutWeight(1)
      ButtomComp({page:1})
    }
    .height('100%')
    .width('100%')
  }
}