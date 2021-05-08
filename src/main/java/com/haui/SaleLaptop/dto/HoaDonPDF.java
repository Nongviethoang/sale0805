package com.haui.SaleLaptop.dto;

import java.awt.Color;
import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.method.P;

import com.haui.SaleLaptop.entities.ChiTietEntity;
import com.haui.SaleLaptop.entities.DonHangEntity;
import com.ibm.icu.text.NumberFormat;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

public class HoaDonPDF {
	private DonHangEntity saleOrder;
    public HoaDonPDF(DonHangEntity saleOrder) {
        this.saleOrder = saleOrder;
    }
    public void export(HttpServletResponse response) throws DocumentException, IOException {
        Document document = new Document(PageSize.A5);
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();
        BaseFont bf = BaseFont.createFont("C:\\Users\\ADMIN\\eclipse-workspace\\SaleLaptop\\src\\main\\resources\\arial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font font = new Font(bf,14);
        font.setColor(Color.BLACK);
        Paragraph title = new Paragraph("Cửa hàng máy tính Ngọc Hưng - 104 Phố Nhổn - Bắc Từ Liêm - Hà Nội", font);
        title.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(title);
        document.add(new Paragraph("Số điện thoại: 036954454",font));
        Paragraph name = new Paragraph("HÓA ĐƠN BÁN HÀNG", font);
        name.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(name);
        document.add(new Paragraph("Mã hóa đơn:"+saleOrder.getSeo()+"  Ngày lập:"+saleOrder.getNgayLap()));
        document.add(new Paragraph("Tên khách hàng:"+saleOrder.getTenKhachHang(),font));
        document.add(new Paragraph("Địa chỉ:"+saleOrder.getDiaChi(),font));
        document.add(new Paragraph("Số điện thoại:"+saleOrder.getSoDienThoai(),font));
        document.add(new Paragraph("SẢN PHẨM",font));
        document.add(new Paragraph("********",font));
        for (ChiTietEntity  item : saleOrder.getChiTiets()) {
        	 document.add(new Paragraph(item.getSanPhams().getTenSanPham()+" x"+item.getSoLuong(),font));
		}
        Locale locale = new Locale("vi", "VN");      
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        document.add(new Paragraph("Tổng:"+currencyFormatter.format(saleOrder.getTongTien().doubleValue()),font));
        document.close();
    }
}
