import request from '@/utils/request'

// 查询门诊管理列表
export function listClinic(query) {
  return request({
    url: '/sys_clinic/clinic/list',
    method: 'get',
    params: query
  })
}

// 查询门诊管理详细
export function getClinic(clinicId) {
  return request({
    url: '/sys_clinic/clinic/' + clinicId,
    method: 'get'
  })
}

// 新增门诊管理
export function addClinic(data) {
  return request({
    url: '/sys_clinic/clinic',
    method: 'post',
    data: data
  })
}

// 修改门诊管理
export function updateClinic(data) {
  return request({
    url: '/sys_clinic/clinic',
    method: 'put',
    data: data
  })
}


// 根据Id修改门诊状态
/**此方法还没编写后端接口 */
export function updateClinicSatus(clinicId,Status) {
  return request({
    url: '/his/dept/'+clinicId+'/'+Status,
    method: 'put',
  })
}

// 删除门诊管理
export function delClinic(clinicId) {
  return request({
    url: '/sys_clinic/clinic/' + clinicId,
    method: 'delete'
  })
}
