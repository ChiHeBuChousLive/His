import request from '@/utils/request'

// 查询医疗设备保养列表
export function listUpkeep(query) {
  return request({
    url: '/system/upkeep/list',
    method: 'get',
    params: query
  })
}

// 查询医疗设备保养详细
export function getUpkeep(upkeepId) {
  return request({
    url: '/system/upkeep/' + upkeepId,
    method: 'get'
  })
}

// 新增医疗设备保养
export function addUpkeep(data) {
  return request({
    url: '/system/upkeep',
    method: 'post',
    data: data
  })
}

// 修改医疗设备保养
export function updateUpkeep(data) {
  return request({
    url: '/system/upkeep',
    method: 'put',
    data: data
  })
}

// 删除医疗设备保养
export function delUpkeep(upkeepId) {
  return request({
    url: '/system/upkeep/' + upkeepId,
    method: 'delete'
  })
}
