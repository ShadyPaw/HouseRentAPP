// 视频接口

/**
 * id
 * @param cover 封面图
 * @param title 标题
 * @param href 视频链接
 * @param controller video控制器
 * **/
export interface videoList {
  id: number,
  cover: string | Resource,
  title: string,
  href: string,
  controller: VideoController
}