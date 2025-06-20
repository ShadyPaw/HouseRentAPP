import { ButtomComp } from '../components/ButtomComp';
import { HeaderComp } from '../components/index/HeaderComp';
import { CarouselComp } from '../components/index/CarouselComp';
import { MainComp } from '../components/index/MainComp';
import { SwiperComp } from '../components/SwiperComp';


@Entry
@Component
struct Index {
  build() {
    Column({ space: 10 }) {
      // 头部
      HeaderComp()
      // 搜索
      CarouselComp()
      // 轮播图
      SwiperComp()
      // 主体
      MainComp()
        .layoutWeight(1)
      ButtomComp()
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#fff')
  }
}