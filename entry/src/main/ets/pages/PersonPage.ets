// 个人中心页
import { ButtomComp } from '../components/ButtomComp';
import { FooterComp } from '../components/person/FooterComp';
import { IconComp } from '../components/person/IconComp';
import { InformationComp } from '../components/person/InformationComp';
import { PersonHeader } from '../components/person/PersonHeader';

@Entry
@Component
struct PersonPage {
  build() {
    Column() {
      PersonHeader()
      Divider().color('#FF5511').margin({ bottom: 5, top: 5 })
      IconComp()
      Divider().color('#FF5511').margin({ bottom: 5, top: 5 })
      InformationComp().layoutWeight(1)
      Divider().color('#FF5511').margin({ bottom: 5, top: 5 })
      FooterComp().padding({ bottom: 16 })
      ButtomComp({page:3})
    }
    .height('100%')
    .width('100%')
    .linearGradient({
      colors: [['#ffbefdfd', 0.1], ['#e2f9fdfc', 0.6]]
    })
  }
}