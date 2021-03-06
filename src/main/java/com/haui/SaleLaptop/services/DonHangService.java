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
import com.haui.SaleLaptop.reponsitory.DonHangRepository;
import com.haui.SaleLaptop.tagligs.PaginationTaglib;
import com.ibm.icu.text.NumberFormat;

@Service
public class DonHangService {
	@PersistenceContext
	EntityManager entityManager;
	@Autowired
	DonHangRepository donHangRepo;
	@Autowired
    private JavaMailSender mailSender;
	
	public List<DonHangEntity> layDonHangCuaKhach(int idKhach)
	{
		String sql="SELECT * FROM salecomputer.tbl_don_hang d WHERE d.id_thanhvien = "+idKhach+"";
		Query query=entityManager.createNativeQuery(sql, DonHangEntity.class);
		return query.getResultList();
	}
	public List<DonHangEntity> phanTrang(BaseDTO dto) {
		String jpql=" SELECT m FROM DonHangEntity m WHERE 1=1";
		if (!StringUtils.isEmpty(dto.getSearchText())) {
			jpql = jpql + " AND (m.tenKhachHang LIKE '%" +dto.getSearchText()+"%') OR (m.diaChi LIKE '%"
					+dto.getSearchText()+"%') OR(m.soDienThoai LIKE '%"+ dto.getSearchText()+"%') ORDER BY id DESC";
		}
		Query query=entityManager.createQuery(jpql, DonHangEntity.class);
		// paging
				if (dto.getOffset() != null) {
					dto.setCount(query.getResultList().size());
					query.setFirstResult(dto.getOffset());
					query.setMaxResults(PaginationTaglib.MAX);
				}
	return query.getResultList();
	}
	//L???y ????n h??ng th??ng hi???n t???i
	public List<DonHangEntity> layDonHangThangHienTai()
	{
		String sql="SELECT * FROM salecomputer.tbl_don_hang where month(ngay_lap)=month(now()); ";
		Query query=entityManager.createNativeQuery(sql, DonHangEntity.class);
		return query.getResultList();
	}
	//L???y ????n h??ng theo th???i gian
	public List<DonHangEntity> layDonHangTheoThoiGian(String start, String end)
	{
		String sql="SELECT * FROM salecomputer.tbl_don_hang WHERE ngay_lap between '"+start+"' AND '"+end+"'";
		Query query=entityManager.createNativeQuery(sql, DonHangEntity.class);
		System.out.println(sql);
		return query.getResultList();
	}
	//L
	public List<DonHangEntity> layDonHangThangHienTai(BaseDTO dto)
	{
		
		String sql="SELECT * FROM salecomputer.tbl_don_hang WHERE month(ngay_lap)=month(now())";
		Query query=entityManager.createNativeQuery(sql, DonHangEntity.class);
		if (dto.getOffset() != null) {
			dto.setCount(query.getResultList().size());
			query.setFirstResult(dto.getOffset());
			query.setMaxResults(PaginationTaglib.MAX);
		}
		return query.getResultList();
	}
	//L???y ????n h??ng theo tr???ng th??i
	public List<DonHangEntity> trangThai(BaseDTO dto)
	{
		
		String sql="SELECT * FROM salecomputer.tbl_don_hang WHERE trang_thai="+dto.getStatus()+"";
		Query query=entityManager.createNativeQuery(sql, DonHangEntity.class);
		if (dto.getOffset() != null) {
			dto.setCount(query.getResultList().size());
			query.setFirstResult(dto.getOffset());
			query.setMaxResults(PaginationTaglib.MAX);
		}
		return query.getResultList();
	}
	//????n h??ng theo tr???ng th??i hi???n t???i
	public List<DonHangEntity> trangThaiThangHienTai(BaseDTO dto)
	{
		
		String sql="SELECT * FROM salecomputer.tbl_don_hang WHERE month(ngay_lap)=month(now()) AND trang_thai= "+dto.getStatus()+"";
		Query query=entityManager.createNativeQuery(sql, DonHangEntity.class);
		if (dto.getOffset() != null) {
			dto.setCount(query.getResultList().size());
			query.setFirstResult(dto.getOffset());
			query.setMaxResults(PaginationTaglib.MAX);
		}
		System.out.println("so don_"+query.getResultList().size());
		return query.getResultList();
	}
	//Tr???ng th??i ????n hagnf theo th???i gian l???c
	public List<DonHangEntity> trangThaiDonHangLoc(BaseDTO dto)
	{
		String sql="SELECT * FROM salecomputer.tbl_don_hang WHERE ngay_lap BETWEEN+'"+dto.getStartTime()+"' AND '"+dto.getEndTime()+"' AND trang_thai= "+dto.getStatus()+"";
		Query query=entityManager.createNativeQuery(sql, DonHangEntity.class);
		if (dto.getOffset() != null) {
			dto.setCount(query.getResultList().size());
			query.setFirstResult(dto.getOffset());
			query.setMaxResults(PaginationTaglib.MAX);
		}
		return query.getResultList();
	}
	//L???y ????n h??ng l???c theo th???i gian
	public List<DonHangEntity> layDonHangThangLoc(BaseDTO dto)
	{
		String sql="SELECT * FROM salecomputer.tbl_don_hang WHERE ngay_lap BETWEEN+'"+dto.getStartTime()+"' AND '"+dto.getEndTime()+"'";
		Query query=entityManager.createNativeQuery(sql, DonHangEntity.class);
		if (dto.getOffset() != null) {
			dto.setCount(query.getResultList().size());
			query.setFirstResult(dto.getOffset());
			query.setMaxResults(PaginationTaglib.MAX);
		}
		return query.getResultList();
	}
	public void sendVerificationEmail(ThanhVienEntity user,DonHangEntity order)
	        throws MessagingException, UnsupportedEncodingException {
	    String toAddress = user.getEmail();
	    Locale locale = new Locale("vi", "VN");      
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
	    String fromAddress = "ngochungcomputerstore@gmail.com";
	    String senderName = "Ng???c H??ng Computer";
	    String subject = "Th??ng b??o ????n h??ng";
	    String content = "Dear [[name]],<br>"
	            + "C???m ??n b???n ???? ?????t h??ng:<br>"
	            + "M?? ????n h??ng c???a b???n l??"+order.getSeo()+"<br> T???ng ti???n"+currencyFormatter.format(order.getTongTien())+"<br> Ch??ng t??i s??? s???m giao ?????n t???n n??i cho b???n <br>";
	    String hang="";
	    for (ChiTietEntity ct : order.getChiTiets()) {
			hang+=ct.getSanPhams().getTenSanPham()+" S??? l?????ng "+ct.getSoLuong()+" ????n gi?? "+ct.getSanPhams().getGia();
		}
	    content=content+hang+ "C???m ??n s??? ???ng h??? c???a b???n,<br>"
	            + "Ng???c H??ng Computer";;
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(message);
	    helper.setFrom(fromAddress, senderName);
	    helper.setTo(toAddress);
	    helper.setSubject(subject);
	    content = content.replace("[[name]]", user.getHoTen());
	    helper.setText(content, true);
	    mailSender.send(message);
	    System.out.println("Th??nh c??ng");
	}
}
