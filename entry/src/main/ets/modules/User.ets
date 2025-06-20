/**
 * 用户信息
 * */
export interface User {
  id: number
  nickname: string
  pwd: string
  birthday: Date
  sex: boolean
  code: number
  address: string
  date: Date
  email: string
  phone: number
  isPlay: boolean
  integral: number
  introduction: string
  state: boolean
  mainCourt: string
  follow: string
  matchs: string
}

/**
 * 个人中心菜单
 * */
export interface information {
  image: string | Resource
  title: string,
  routerUrl: string
}




