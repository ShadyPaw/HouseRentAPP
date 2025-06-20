export class User{
  img:string
  username:string
  score:number

  constructor(img: string, username: string, score: number) {
    this.img = img
    this.username = username
    this.score = score
  }

}
@Component
export struct PHComp {
  private userList:User[] = [
    new User("https://tse1-mm.cn.bing.net/th/id/OIP-C.kXCp2JbRyhtKoitLbhfPxQHaEo?w=278&h=180&c=7&r=0&o=7&pid=1.7&rm=3","独居一室一厅",1800),
    new User("https://tse4-mm.cn.bing.net/th/id/OIP-C.9r_jXOzF7S7di0jTQvSMgAHaFj?w=252&h=189&c=7&r=0&o=7&pid=1.7&rm=3","合租两室一厅",1700),
    new User("https://tse2-mm.cn.bing.net/th/id/OIP-C._YS6VFsqIgeGlKf4Safu-QHaE8?w=283&h=189&c=7&r=0&o=7&pid=1.7&rm=3","整租三室一厅一厨一卫",1600),
    new User("https://tse4-mm.cn.bing.net/th/id/OIP-C.1gDBuy9BULaftIzHaNgBywHaFj?w=251&h=189&c=7&r=0&o=7&pid=1.7&rm=3","清水房两居室40㎡",1579),
    new User("https://tse1-mm.cn.bing.net/th/id/OIP-C.OufeCsECYKYgK9VPibRKCQHaEA?w=324&h=180&c=7&r=0&o=7&pid=1.7&rm=3","整租三室一厅一厨一卫",1577),
    new User("https://tse2-mm.cn.bing.net/th/id/OIP-C.UcG_ASa5R-2mZnMMsYjwDgHaE7?w=274&h=182&c=7&r=0&o=7&pid=1.7&rm=3","独居一室一厅",1500),
    new User("https://tse1-mm.cn.bing.net/th/id/OIP-C.riCxm2aixAVDNPtE2X1TXAHaFj?w=257&h=192&c=7&r=0&o=7&pid=1.7&rm=3","合租两室一厅",1470),
    new User("https://tse1-mm.cn.bing.net/th/id/OIP-C.W8g5PrlDZqdomqnrQyvNhgAAAA?w=241&h=181&c=7&r=0&o=7&pid=1.7&rm=3","整租三室一厅一厨一卫",1430),
    new User("https://tse4-mm.cn.bing.net/th/id/OIP-C.--MYk8KLWZqDz2xtFAjOfAHaE8?w=280&h=187&c=7&r=0&o=7&pid=1.7&rm=3","独居一室一厅",1400),
    new User("https://tse1-mm.cn.bing.net/th/id/OIP-C.5ZuPlKd8eJfDYzSCJ1uHZgHaE6?w=260&h=180&c=7&r=0&o=7&pid=1.7&rm=3","合租两室一厅",1330),
    new User("https://tse3-mm.cn.bing.net/th/id/OIP-C.OBctjl4OLiYdFE5jv-93IQHaFK?w=246&h=180&c=7&r=0&o=7&pid=1.7&rm=3","整租三室一厅一厨一卫",1230),
    new User("https://tse1-mm.cn.bing.net/th/id/OIP-C.Arog2_ZLw-rcqjA-QYWeZgHaFj?w=222&h=185&c=7&r=0&o=7&pid=1.7&rm=3","合租两室一厅",1130),
  ]
  build() {
    Column(){
      List({space:10}){
        ForEach(this.userList,(item:User,index:number)=>{
          ListItem(){
            Row({space:10}){
              Image(item.img)
                .width(65)
                .borderRadius(10)
              Column({space:30}){
                Text(item.username)
                Text("热门度"+item.score)
              }
              .layoutWeight(1)
              if(index===0){
                Text((index+1).toString())
                  .fontSize(28)
                  .fontColor("#ff750c0c")
              } else if(index===1){
                Text((index+1).toString())
                  .fontSize(25)
                  .fontColor("#ffbf1313")
              } else if(index===2){
                Text((index+1).toString())
                  .fontSize(21)
                  .fontColor("#fff11a1a")
              }else {
                Text((index+1).toString())
              }
            }
          }
          .backgroundColor("white")
          .borderRadius(10)
          .padding(10)
          .width("100%")
        })
      }
      .scrollBar(BarState.Off)
    }
    .width("100%")
  }
}