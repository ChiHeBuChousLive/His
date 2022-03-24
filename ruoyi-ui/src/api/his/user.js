import request from '@/utils/request'

// 查询His用户信息列表
export function listUser(query) {
  return request({
    url: '/user/user/list',
    method: 'get',
    params: query
  })
}

// 查询His用户信息详细
export function getUser(userId) {
  return request({
    url: '/user/user/' + userId,
    method: 'get'
  })
}

// 新增His用户信息
export function addUser(data) {
  return request({
    url: '/user/user',
    method: 'post',
    data: data
  })
}

// 修改His用户信息
export function updateUser(data) {
  return request({
    url: '/user/user',
    method: 'put',
    data: data
  })
}

// 删除His用户信息
export function delUser(userId) {
  return request({
    url: '/user/user/' + userId,
    method: 'delete'
  })
}
