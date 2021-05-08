package com.haui.SaleLaptop.services;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Locale;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.haui.SaleLaptop.dto.BaseDTO;
import com.haui.SaleLaptop.entities.ChiTietEntity;
import com.haui.SaleLaptop.entities.DonHangEntity;
import com.haui.SaleLaptop.entities.ThanhVienEntity;
import com.haui.SaleLaptop.tagligs.PaginationTaglib;
import com.ibm.icu.text.NumberFormat;

@Service
public class ThanhVienService {
@PersistenceContext
EntityManager entityManager;
@Autowired
private JavaMailSender mailSender;
public List<ThanhVienEntity> phanTrang(BaseDTO dto) {
	String jpql="SELECT m FROM ThanhVienEntity m WHERE 1=1";
	if (!StringUtils.isEmpty(dto.getSearchText())) {
		jpql = jpql + " AND (m.diaChi LIKE '%" +dto.getSearchText()+"%') OR (m.soDienThoai LIKE '%"
				+dto.getSearchText()+"%') OR(m.email LIKE '%"+ dto.getSearchText()+"%') OR(m.hoTen LIKE '%"+ dto.getSearchText()+"%')";
	}
	Query query=entityManager.createQuery(jpql, ThanhVienEntity.class);
	// paging
		if (dto.getOffset() != null) {
			dto.setCount(query.getResultList().size());

			query.setFirstResult(dto.getOffset());
			query.setMaxResults(PaginationTaglib.MAX);
		}
		return query.getResultList();
}
public ThanhVienEntity loadUserByUsername(String email) {
	try {
		String jpql = "Select u From ThanhVienEntity u Where 1=1";
		jpql=jpql+"AND u.email='" + email + "'";
		Query query = entityManager.createQuery(jpql, ThanhVienEntity.class);
		System.out.println("email là"+email);
		ThanhVienEntity tv=(ThanhVienEntity)query.getSingleResult();
		System.out.println("tvlaf :"+tv);
		return tv;
	} catch (Exception e) {
		e.printStackTrace();
		return null;
	}
}
public void xacNhanEmail(String email,String link)
        throws MessagingException, UnsupportedEncodingException {
    
    String fromAddress = "ngochungcomputerstore@gmail.com";
    String senderName = "Ngọc Hưng Computer";
    String subject = "Xác nhận tài khoản";
    String content = "<p>Xin chào,</p>" + "<p>Yêu cầu xác nhận email</p>"
			+ "<p>Click vào link để xác nhận đăng kí</p>" + "<p><a href=\"" + link
			+ "\">Xác nhận</a></p>" + "<br>";
    MimeMessage message = mailSender.createMimeMessage();
    MimeMessageHelper helper = new MimeMessageHelper(message);
    helper.setFrom(fromAddress, senderName);
    helper.setTo(email);
    helper.setSubject(subject);
    helper.setText(content, true);
    mailSender.send(message);
    System.out.println("Thành công");
}
}
