package com.example.demo.report;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.context.annotation.Configuration;

import com.example.demo.entity.Cart;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Configuration
public class GeneratePDF {

	public static ByteArrayInputStream studentReport(int quantity,int total,List<Cart> details) throws MalformedURLException, IOException {

		Document document = new Document(PageSize.A4);

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		Font headFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD,10);
		Font recipt = FontFactory.getFont(FontFactory.COURIER_BOLDOBLIQUE,18);
		Font table_Head = FontFactory.getFont(FontFactory.HELVETICA_BOLD,15);
		Font content = FontFactory.getFont(FontFactory.COURIER_BOLDOBLIQUE,12);
		Font table_last = FontFactory.getFont(FontFactory.HELVETICA_BOLD,15);
		Font last = FontFactory.getFont(FontFactory.HELVETICA_BOLD,10);
		
		
		Paragraph p1 = new Paragraph("Online Shopping World", headFont);
        p1.setAlignment(Paragraph.ALIGN_RIGHT);
		Paragraph p2 = new Paragraph("Bill Receipt", recipt);
        p2.setAlignment(Paragraph.ALIGN_CENTER);
        
      //To display time 
      		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
      		LocalDateTime now = LocalDateTime.now();
      		Paragraph p3 = new Paragraph("*This receipt was generated on " + dtf.format(now),last);
            p3.setAlignment(Paragraph.ALIGN_LEFT);
                   
		try {

			PdfPTable table = new PdfPTable(6);
			table.setWidthPercentage(90);
			table.setWidths(new int[] {4,6,10,5,4,6});
			
			PdfPCell hcell;
			
			hcell = new PdfPCell(new Phrase("S.No.", table_Head));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setVerticalAlignment(Element.ALIGN_CENTER);
			hcell.setFixedHeight(30f);
			hcell.setBorder(0);
			hcell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("P.ID", table_Head));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setVerticalAlignment(Element.ALIGN_CENTER);
			hcell.setFixedHeight(30f);
			hcell.setBorder(0);
			hcell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Description", table_Head));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setVerticalAlignment(Element.ALIGN_CENTER);
			hcell.setFixedHeight(30f);
			hcell.setBorder(0);
			hcell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("Rate", table_Head));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setVerticalAlignment(Element.ALIGN_CENTER);
			hcell.setFixedHeight(30f);
			hcell.setBorder(0);
			hcell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("Qty", table_Head));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setVerticalAlignment(Element.ALIGN_CENTER);
			hcell.setFixedHeight(30f);
			hcell.setBorder(0);
			hcell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			table.addCell(hcell);
			
			hcell = new PdfPCell(new Phrase("Amount", table_Head));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setVerticalAlignment(Element.ALIGN_CENTER);
			hcell.setFixedHeight(30f);
			hcell.setBorder(0);
			hcell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			table.addCell(hcell);
			
			//Create Image object
	        Image left = Image.getInstance("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLKIdJHv-l7mkMEOfCaiQglorgz-6gApNZ9A&usqp=CAU");
	        left.scalePercent(10,10);
	        left.setAlignment(Element.ALIGN_RIGHT);
	        
	        int itemNum = 1;

			for (Cart cart : details) {

				PdfPCell cell;
				
				cell = new PdfPCell(new Phrase(String.valueOf(itemNum),content));
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell.setVerticalAlignment(Element.ALIGN_CENTER);
				cell.setFixedHeight(23f);
				cell.setBorder(0);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(cart.getProductId(),content));
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell.setVerticalAlignment(Element.ALIGN_CENTER);
				cell.setFixedHeight(23f);
				cell.setBorder(0);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(cart.getProductName(),content));
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell.setVerticalAlignment(Element.ALIGN_CENTER);
				cell.setFixedHeight(23f);
				cell.setBorder(0);
				cell.setBorderColorLeft(BaseColor.BLACK);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(cart.getProductPrice(),content));
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell.setVerticalAlignment(Element.ALIGN_CENTER);
				cell.setFixedHeight(23f);
				cell.setBorder(0);
				table.addCell(cell);
				
				cell = new PdfPCell(new Phrase(cart.getQuantity(),content));
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell.setVerticalAlignment(Element.ALIGN_CENTER);
				cell.setFixedHeight(23f);
				cell.setBorder(0);
				table.addCell(cell);
				
				cell = new PdfPCell(new Phrase(cart.getSubTotal(),content));
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell.setVerticalAlignment(Element.ALIGN_CENTER);
				cell.setFixedHeight(23f);
				cell.setBorder(0);
				table.addCell(cell);
				
				itemNum += 1;
			}
			
			PdfPCell cell;
			
			cell = new PdfPCell(new Phrase("",table_last));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(30f);
			cell.setBorder(0);
			cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("Total",table_last));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(30f);
			cell.setBorder(0);
			cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("",table_last));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(30f);
			cell.setBorder(0);
			cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase("",table_last));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(30f);
			cell.setBorder(0);
			cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			table.addCell(cell);
			
			cell = new PdfPCell(new Phrase(String.valueOf(quantity),table_last));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(23f);
			cell.setBorder(0);
			cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			table.addCell(cell);
			
			cell = new PdfPCell(new Phrase("Rs."+total+" /-",table_last));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(30f);
			cell.setBorder(0);
			cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			table.addCell(cell);

			PdfWriter.getInstance(document, out);
			document.open();
			
	        document.add(left);
	        //document.add(right);
			document.add(p1);
	        document.add(Chunk.NEWLINE );
	        document.add(p2);
	        document.add(Chunk.NEWLINE );
			document.add(table);
			document.add(Chunk.NEWLINE );
			document.add(p3);

			document.close();

		} catch (DocumentException ex) {

		}

		return new ByteArrayInputStream(out.toByteArray());
	}

}