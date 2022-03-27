import request from '@/utils/request'

// 查询位置信息管理列表
export function listSeat(query) {
  return request({
    url: '/condition/seat/list',
    method: 'get',
    params: query
  })
}

// 查询位置信息管理详细
export function getSeat(seatId) {
  return request({
    url: '/condition/seat/' + seatId,
    method: 'get'
  })
}

// 新增位置信息管理
export function addSeat(data) {
  return request({
    url: '/condition/seat',
    method: 'post',
    data: data
  })
}

// 修改位置信息管理
export function updateSeat(data) {
  return request({
    url: '/condition/seat',
    method: 'put',
    data: data
  })
}

// 删除位置信息管理
export function delSeat(seatId) {
  return request({
    url: '/condition/seat/' + seatId,
    method: 'delete'
  })
}
