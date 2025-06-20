// WaterFlowDataSource.ets
import { Good, Type } from '../../modules/GoodItems'

// 实现IDataSource接口的对象，用于瀑布流组件加载数据
export class WaterFlowDataSource implements IDataSource {
  // private dataArray: number[] = []
  private dataArray: Good[] = []
  private listeners: DataChangeListener[] = []

  constructor() {
    // for (let i = 0; i < 50; i++) {
    //   this.dataArray.push(i)
    // }
    this.dataArray.push({id:1,name:'精装修两室一厅',stock:2443,desc:'',count:0,color:Color.Black,price:1200,type:Type.badminton,img:'/image/shopImgs/houseImg1.png',mid:0})
    this.dataArray.push({id:2,name:'精装修三室一厅',stock:4365,desc:'',count:0,color:Color.Black,price:890,type:Type.badminton,img:'/image/shopImgs/houseImg2.png',mid:0})
    this.dataArray.push({id:3,name:'花滩国际新城',stock:3245,desc:'',count:0,color:Color.Black,price:4500,type:Type.badminton,img:'/image/shopImgs/houseImg3.png',mid:0})
    this.dataArray.push({id:4,name:'法院旁蓝色天际二室',stock:5763,desc:'',count:0,color:Color.Black,price:2300,type:Type.badminton,img:'/image/shopImgs/houseImg4.png',mid:0})
    this.dataArray.push({id:5,name:'人民广场一室一厅',stock:4443,desc:'',count:0,color:Color.Black,price:2300,type:Type.badminton,img:'/image/shopImgs/houseImg5.png',mid:0})
    this.dataArray.push({id:6,name:'御龙湾三室两厅',stock:4752,desc:'',count:0,color:Color.Black,price:1200,type:Type.badminton,img:'/image/shopImgs/houseImg6.png',mid:0})
    this.dataArray.push({id:7,name:'鎏金香榭一室一厅',stock:7461,desc:'',count:0,color:Color.Black,price:3000,type:Type.badminton,img:'/image/shopImgs/houseImg5.png',mid:0})
    this.dataArray.push({id:8,name:'整租三室一厅一厨',stock:7363,desc:'',count:0,color:Color.Black,price:3450,type:Type.badminton,img:'/image/shopImgs/houseImg7.png',mid:0})
    this.dataArray.push({id:9,name:'精装修两室一厅',stock:8921,desc:'',count:0,color:Color.Black,price:1500,type:Type.badminton,img:'/image/shopImgs/houseImg8.png',mid:0})
    this.dataArray.push({id:10,name:'玉龙两室一厅',stock:2341,desc:'',count:0,color:Color.Black,price:2600,type:Type.badminton,img:'/image/shopImgs/houseImg6.png',mid:0})
  }

  // 获取索引对应的数据
  public getData(index: number): Good {
    return this.dataArray[index]
  }

  // 通知控制器数据重新加载
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded()
    })
  }

  // 通知控制器数据增加
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index)
    })
  }

  // 通知控制器数据变化
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index)
    })
  }

  // 通知控制器数据删除
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index)
    })
  }

  // 通知控制器数据位置变化
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to)
    })
  }

  // 获取数据总数
  public totalCount(): number {
    return this.dataArray.length
  }

  // 注册改变数据的控制器
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  // 注销改变数据的控制器
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1)
    }
  }

  // 增加数据
  public add1stItem(item:Good): void {
    this.dataArray.splice(0, 0, item)
    this.notifyDataAdd(0)
  }

  // 在数据尾部增加一个元素
  public addLastItem(item:Good): void {
    this.dataArray.splice(this.dataArray.length, 0, item)
    this.notifyDataAdd(this.dataArray.length - 1)
  }

  // 在指定索引位置增加一个元素
  public addItem(index: number,item:Good): void {
    this.dataArray.splice(index, 0, item)
    this.notifyDataAdd(index)
  }

  // 删除第一个元素
  public delete1stItem(): void {
    this.dataArray.splice(0, 1)
    this.notifyDataDelete(0)
  }

  // 删除第二个元素
  public delete2ndItem(): void {
    this.dataArray.splice(1, 1)
    this.notifyDataDelete(1)
  }

  // 删除最后一个元素
  public deleteLastItem(): void {
    this.dataArray.splice(-1, 1)
    this.notifyDataDelete(this.dataArray.length)
  }

  // 重新加载数据
  public reload(): void {
    this.dataArray.splice(1, 1)
    this.dataArray.splice(3, 2)
    this.notifyDataReload()
  }
}

