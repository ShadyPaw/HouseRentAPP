import { HistoryComp } from '../components/SearchComp/HistoryComp';
import { LoveComp } from '../components/SearchComp/LoveComp';

@Entry
@Component
struct SearchPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      HistoryComp().width('100%')
      LoveComp().layoutWeight(1)
    }
    .height('100%')
    .width('100%')
  }
}