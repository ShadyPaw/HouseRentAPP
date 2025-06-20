import { router } from '@kit.ArkUI'
import { CustomDiaLogComp } from './CustomDiaLogComp/CustomDiaLogComp'

@Styles
function handleClick() {
  .onClick(() => {
    const token = AppStorage.get<string>('token')
    if (token == '') {
      router.pushUrl({
        url: 'pages/LoginPage'
      })
    }
  })
}

@Component
export struct ButtomComp {
  @State page: number = 0
  @StorageLink('token') token: string = ''
  diaLoaController: CustomDialogController = new CustomDialogController({
    builder: CustomDiaLogComp()
  })

  aboutToAppear(): void {
    const token: string = AppStorage.get<string>('token') as string
    this.token = token
    if(this.token==''){
      router.pushUrl({
        url:'pages/LoginPage'
      })
    }
  }

  build() {
    Row() {
      Column({space:3}){
        Image(this.page === 0 ?  '/image/homeIcon_st.svg': '/image/homeIcon.svg')
          .width(30)
          .height(30)
        Text("首页")
          .width("20%")
          .fontSize(15)
          .fontColor(this.page === 0 ? '#ff0392be': '#ff050505')
          .textAlign(TextAlign.Center)

      }
      .onClick(() => {
        router.pushUrl({
          url: "pages/Index",
        })
      })
  Column(){
    Image(this.page === 1 ?  '/image/classfication_st.svg': '/image/classfication.svg')
      .width(30)
      .height(30)
    Text("热门")
      .width("20%")
      .fontSize(15)
      .fontColor(this.page === 1 ? '#ff0392be': '#ff050505')
      .textAlign(TextAlign.Center)

  }
  .onClick(() => {
    router.pushUrl({
      url: "pages/ShopPage"
    })
  })

  Column(){
    Image('/image/进行中 (2).svg')
      .width(33)
      .height(33)
    Text("预约")
      .width("20%")
      .fontSize(15)
      .fontColor(this.page === 2 ? '#ff0392be': '#ff070707')
      .textAlign(TextAlign.Center)
      }
        .onClick(() => {
          this.diaLoaController.open()
        })

      Column(){
        Image(this.page === 2 ?  '/image/starlist_st.svg':'/image/startlist.svg' )
          .width(30)
          .height(30)
        Text("收藏")
          .width("20%")
          .fontSize(15)
          .fontColor(this.page === 2 ? '#ff0392be': '#ff070707')
          .textAlign(TextAlign.Center)

      }
      .onClick(() => {
        router.pushUrl({
          url: "pages/CollectPage"
        })
      })
    Column(){
      Image(this.page === 3 ?  '/image/mineIcon_st.svg':'/image/mineIcon.svg' )
        .width(30)
        .height(30)
      Text("我的")
        .width("20%")
        .fontSize(15)
        .fontColor(this.page === 3 ? '#ff0392be': '#ff070707')
        .textAlign(TextAlign.Center)

    }
    .onClick(() => {
      router.pushUrl({
        url: 'pages/PersonPage'
      })
    })

    }
    .width("100%")
    .backgroundColor("#fffefeff")
    .height(50)
  }
}