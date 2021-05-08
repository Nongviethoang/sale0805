package com.haui.SaleLaptop.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.haui.SaleLaptop.dto.HoaDonPDF;
import com.haui.SaleLaptop.entities.ChiTietEntity;
import com.haui.SaleLaptop.entities.DonHangEntity;
import com.haui.SaleLaptop.reponsitory.ChiTietDonHangRepository;
import com.haui.SaleLaptop.reponsitory.DonHangRepository;
import com.ibm.icu.text.DateFormat;
import com.ibm.icu.text.SimpleDateFormat;
import com.lowagie.text.DocumentException;

@Controller
public class ChiTietDonHangController {
	@Autowired
	private ChiTietDonHangRepository chiTietRepo;
	@Autowired
	private DonHangRepository donHangRepo;
	@RequestMapping(value = {"/admin1/chitetdonhang/{id}"}, method = RequestMethod.GET)
	public String index(final ModelMap model,@PathVariable("id") int id, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		List<ChiTietEntity> listChiTiet=chiTietRepo.findAll();
		model.addAttribute("listChiTiet", listChiTiet);
	return "admin/ChiTietDonHang";
	}
	@RequestMapping(value = {"/admin1/chitetdonhang/xuathoadon/{id}"}, method = RequestMethod.GET)
	public String xuatHoaDon(final ModelMap model,@PathVariable("id") int id, final HttpServletRequest request, final HttpServletResponse response)
		throws DocumentException, IOException {
		response.setContentType("application/pdf;charset=UTF-8");
        String headerKey = "Content-Disposition";
        DonHangEntity dh=donHangRepo.getOne(id);
        String headerValue = "attachment; filename=order_" + dh.getSeo() + ".pdf";
        response.setHeader(headerKey, headerValue);
        HoaDonPDF exporter = new HoaDonPDF(dh);
        exporter.export(response);
	return "redirect:/admin1/donhang/chitiet/"+id+"";
	}
}
