import request from '@/utils/request'

// 查询岗位列表
export function listDept(query) {
  return request({
    url: '/his/dept/list',
    method: 'get',
    params: query
  })
}

// 查询岗位详细
export function getDept(deptId) {
  return request({
    url: '/his/dept/' + deptId,
    method: 'get'
  })
}

// 新增岗位
export function addDept(data) {
  return request({
    url: '/his/dept',
    method: 'post',
    data: data
  })
}

// 修改岗位
export function updateDept(data) {
  return request({
    url: '/his/dept',
    method: 'put',
    data: data
  })
}

// 根据Id修改状态
export function updateDeptSatus(deptId,Status) {
  return request({
    url: '/his/dept/'+deptId+'/'+Status,
    method: 'put',
    // data: deptId,Status
  })
}

// 删除岗位
export function delDept(deptId) {
  return request({
    url: '/his/dept/' + deptId,
    method: 'delete'
  })
}
