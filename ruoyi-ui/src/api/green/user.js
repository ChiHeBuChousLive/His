import request from '@/utils/request'

// 查询岗位列表
export function listUser(query) {
  return request({
    url: '/green/user/list',
    method: 'get',
    params: query
  })
}

// 查询岗位详细
export function getUser(userId) {
  return request({
    url: '/green/user/' + userId,
    method: 'get'
  })
}

// 新增岗位
export function addUser(data) {
  return request({
    url: '/green/user',
    method: 'post',
    data: data
  })
}

// 修改岗位
export function updateUser(data) {
  return request({
    url: '/green/user',
    method: 'put',
    data: data
  })
}

// 删除岗位
export function delUser(userId) {
  return request({
    url: '/green/user/' + userId,
    method: 'delete'
  })
}
