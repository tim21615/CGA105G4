package com.artliked.model;

import java.util.*;

public interface ArtLikedDAO_interface {
          public void insert(ArtLikedVO articleLikedVO);
          public void update(ArtLikedVO articleLikedVO);
          public void delete(Integer articleId);
          public ArtLikedVO findByPrimaryKey(Integer articleId);
          public List<ArtLikedVO> getAll();
          //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//        public List<EmpVO> getAll(Map<String, String[]> map); 
}
