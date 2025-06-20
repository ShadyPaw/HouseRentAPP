// 数据懒加载定义
import { videoList } from '../modules/VideoList';

interface IDataSource {
  totalCount(): number;
  getData(index: number): videoList;
  registerDataChangeListener(listener: DataChangeListener): void;
  unregisterDataChangeListener(listener: DataChangeListener): void;
  notifyDataReload(): void;
  notifyDataAdd(index: number): void;
  notifyDataChange(index: number): void;
  notifyDataDelete(index: number): void;
}

export interface DataChangeListener {
  onDataReloaded(): void;
  onDataAdd(index: number): void;
  onDataChange(index: number): void;
  onDataDelete(index: number): void;
}

export class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private data: videoList[] = [];

  totalCount(): number {
    return this.data.length;
  }

  getData(index: number): videoList {
    return this.data[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const index = this.listeners.indexOf(listener);
    if (index >= 0) {
      this.listeners.splice(index, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => listener.onDataReloaded());
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => listener.onDataAdd(index));
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => listener.onDataChange(index));
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => listener.onDataDelete(index));
  }

  // Methods to manipulate data
  addData(data: videoList): void {
    this.data.push(data);
    this.notifyDataAdd(this.data.length - 1);
  }

  updateData(index: number, data: videoList): void {
    this.data[index] = data;
    this.notifyDataChange(index);
  }

  deleteData(index: number): void {
    this.data.splice(index, 1);
    this.notifyDataDelete(index);
  }
}
