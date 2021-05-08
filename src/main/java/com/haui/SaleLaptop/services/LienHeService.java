package com.haui.SaleLaptop.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.haui.SaleLaptop.dto.BaseDTO;
import com.haui.SaleLaptop.entities.DanhMucEntity;
import com.haui.SaleLaptop.entities.LienHeEntity;
import com.haui.SaleLaptop.tagligs.PaginationTaglib;

@Service
public class LienHeService {
@PersistenceContext
EntityManager entityManager;
public List<LienHeEntity> phanTrang(BaseDTO dto) {
	String jpql="SELECT m FROM LienHeEntity m WHERE 1=1";
	if (!StringUtils.isEmpty(dto.getSearchText())) {
		jpql = jpql + " AND (m.noiDung LIKE '%" +dto.getSearchText()+"%') OR (m.hoTen LIKE '%"
				+dto.getSearchText()+"%') OR(m.email LIKE '%"+ dto.getSearchText()+"%') OR (m.soDienThoai LIKE '%"+dto.getSearchText()+"%')";
	}
	Query query = entityManager.createQuery(jpql, LienHeEntity.class);
	// paging
	if (dto.getOffset() != null) {
		dto.setCount(query.getResultList().size());

		query.setFirstResult(dto.getOffset());
		query.setMaxResults(PaginationTaglib.MAX);
	}
	return query.getResultList();
}
}
