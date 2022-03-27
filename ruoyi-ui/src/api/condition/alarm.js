import request from '@/utils/request'

// 查询设备警报管理列表
export function listAlarm(query) {
  return request({
    url: '/condition/alarm/list',
    method: 'get',
    params: query
  })
}

// 查询设备警报管理详细
export function getAlarm(alarmId) {
  return request({
    url: '/condition/alarm/' + alarmId,
    method: 'get'
  })
}

// 新增设备警报管理
export function addAlarm(data) {
  return request({
    url: '/condition/alarm',
    method: 'post',
    data: data
  })
}

// 修改设备警报管理
export function updateAlarm(data) {
  return request({
    url: '/condition/alarm',
    method: 'put',
    data: data
  })
}

// 删除设备警报管理
export function delAlarm(alarmId) {
  return request({
    url: '/condition/alarm/' + alarmId,
    method: 'delete'
  })
}
