package com.accessfunc.model;

import java.util.List;

public interface AccessFuncDAO_interface { //�w�W�h���l���O
    public void insert(AccessFuncVO adminFuncVO);
    public void update(AccessFuncVO adminFuncVO);
    public void delete(Integer accessFunctionId); //�򥻤W�S���R��
    public AccessFuncVO findByPrimaryKey(Integer accessFunctionId);
    public List<AccessFuncVO> getAll();
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<EmpVO> getAll(Map<String, String[]> map); 
}