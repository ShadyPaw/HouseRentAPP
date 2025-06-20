@Observed
export class Attention{
  src:string
  name:string
  major:string
  num:number
attontion:boolean
  constructor(src:string, name:string,major:string,num:number,attontion:boolean) {
    this.src = src
    this.name = name
    this.major = major
    this.num = num
    this.attontion = attontion
  }
}
 export class DividerTmp {
  strokeWidth: Length = 1
  startMargin: Length = 60
  endMargin: Length = 10
  color: ResourceColor = '#ffe9f0f0'

  constructor(strokeWidth: Length, startMargin: Length, endMargin: Length, color: ResourceColor) {
    this.strokeWidth = strokeWidth
    this.startMargin = startMargin
    this.endMargin = endMargin
    this.color = color
  }
}