/**
 * @param id 商品编号
 * @param name 商品名
 * @param stock 库存
 * @param price 价格
 * @param desc 描述
 * @param count 购买数量
 * @param type 种类
 * @param color 颜色
 * @param mid 店铺id
 * */
export interface Good {
  id: number /*编号*/
  name: string
  img: string | Resource
  stock: number
  price: number
  desc: string
  count: number
  type: Type
  color: Color
  mid: number
}

export enum Type {
  badminton = '羽毛球',
  basketball = '篮球',
  football = '足球',
  pingPong = '乒乓球',
  general = '运动装备'
}