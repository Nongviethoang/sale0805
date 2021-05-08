package com.haui.SaleLaptop.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.haui.SaleLaptop.dto.BaseDTO;
import com.haui.SaleLaptop.entities.DonHangEntity;
import com.haui.SaleLaptop.entities.QuyenEntity;
import com.haui.SaleLaptop.tagligs.PaginationTaglib;

@Service
public class QuyenService {
@PersistenceContext
EntityManager entityManager;
public List<QuyenEntity> phanTrang(BaseDTO dto) {
	String jpql="SELECT m FROM QuyenEntity m WHERE 1=1";
	if (!StringUtils.isEmpty(dto.getSearchText())) {
		jpql = jpql + " AND (m.tenQuyen LIKE '%" +dto.getSearchText()+"%') OR (m.moTa LIKE '%"
				+dto.getSearchText()+"%')";
	}
	Query query=entityManager.createQuery(jpql, QuyenEntity.class);
	// paging
		if (dto.getOffset() != null) {
			dto.setCount(query.getResultList().size());

			query.setFirstResult(dto.getOffset());
			query.setMaxResults(PaginationTaglib.MAX);
		}
		return query.getResultList();
}
}
