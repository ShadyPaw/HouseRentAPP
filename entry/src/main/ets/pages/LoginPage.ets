// 登录页
import router from '@ohos.router';

@Entry
@Component
struct LoginPage {
  @State username: string = '';
  @State password: string = '';
  @State errorMessage: string = '';

  build() {
    Column() {
      // 页面标题
      Text('登录')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 40, bottom: 20 })

      // 用户名输入框
      TextInput({ placeholder: '请输入用户名' })
        .onChange((value: string) => {
          this.username = value;
        })
        .width('80%')
        .height(50)
        .borderRadius(5)
        .borderColor(Color.Gray)
        .padding({ left: 10 })

      // 密码输入框
      TextInput({ placeholder: '请输入密码' })
        .type(InputType.Password)
        .onChange((value) => {
          this.password = value;
          this.errorMessage = ''; // 清除错误信息
        })
        .width('80%')
        .height(50)
        .borderRadius(5)
        .borderColor(Color.Gray)
        .padding({ left: 10 })
        .margin({ top: 10 })

      // 错误信息
      if (this.errorMessage) {
        Text(this.errorMessage)
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ top: 10 })
      }

      // 登录按钮
      Button('登录')
        .width('80%')
        .height(50)
        .backgroundColor(Color.Blue)
        .fontColor(Color.White)
        .borderRadius(5)
        .margin({ top: 20 })
        .onClick(() => {
          const token: string = Math.random().toString()
          AppStorage.setOrCreate('token', token)
          router.back() /*返回到原先的页面*/
        })

      // 忘记密码链接
      Text('忘记密码？')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 20 })
        .onClick(() => {
          console.log('Redirect to forgot password page');
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20 })
    .backgroundColor('#F5F5F5')
  }
}
