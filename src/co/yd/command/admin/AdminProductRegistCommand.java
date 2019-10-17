package co.yd.command.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yd.command.Command;
import co.yd.dao.AddAmountDAO;
import co.yd.dao.AmountDAO;
import co.yd.dao.ProductDAO;
import co.yd.dto.AddAmountDTO;
import co.yd.dto.AmountDTO;
import co.yd.dto.ProductDTO;

public class AdminProductRegistCommand implements Command {
	String uploadFilePath;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MultipartRequest multi = multi(request, response);
		ProductDTO productDto = dto(multi, response);

		ArrayList<AmountDTO> amountList = new ArrayList<AmountDTO>();
		ArrayList<AddAmountDTO> addAmountDtoList = new ArrayList<AddAmountDTO>();
		String path = "";

		boolean productResult = productProcess(productDto); // 상품등록
		boolean amountResult = false;
		boolean addAmountResult = false;
		if (productResult) {

			int amountCount = Integer.parseInt(multi.getParameter("amount_count"));
			amountList = buildAmountDtoList(productDto, amountCount);

			amountResult = amountProcess(amountList);// 재고 등록
			if (amountResult) {
				addAmountDtoList = bulidaddAmountList(amountList); //재고 수량 테이블 생성(amount_id 없음)
				addAmountResult = addAmountProcess(addAmountDtoList); // 재고 수량테이블에 추가
//				System.out.println(addAmountResult);
				Enumeration<?> files = multi.getFileNames();

//				System.out.println(multi.getFileNames());
				String product_new_fileName = "/product" + (productDto.getP_id() + ".jpg");
				String[] amount_new_filename = new String[amountList.size()];
				for (int i = 0; i < amountList.size(); i++) {
					amount_new_filename[i] = "/amount" + String.valueOf(amountList.get(i).getAmount_id() + ".jpg");
				}
				int count = 0;
//				 uploadFilePath //이전 파일 업로드 경로

				while (files.hasMoreElements()) {
					String file = (String) files.nextElement();
					String file_name = multi.getFilesystemName(file);
					if (file_name != null) { //파일 이름이 null 이면 스킵.
						System.out.println(file_name);
						if (count == 0) {
							File src = new File(uploadFilePath, file_name);
							File des = new File(uploadFilePath, "/thumbnail/" + product_new_fileName);
							if (des.exists())
								des.delete();

							src.renameTo(des);

							System.out.println(des.getName());
							count++;
						} else {
							File src = new File(uploadFilePath, file_name);
							File des = new File(uploadFilePath, "/clothesDetail/" + amount_new_filename[count - 1]);
							System.out.println(des.getName());
							if (des.exists())
								des.delete();
							src.renameTo(des);
							count++;
						}
					}

				}

				path = "admin_productListForm.do";
				if (addAmountResult) {

					path = "admin_productListForm.do";
				}
			}

		}
//		else {
//			path = "";
//		}

		return path;
	}

	private ProductDTO dto(MultipartRequest request, HttpServletResponse response) {
		ProductDTO productDto = new ProductDTO();
		productDto.setP_name(request.getParameter("p_name"));
		productDto.setP_price(Integer.parseInt(request.getParameter("p_price")));
		productDto.setP_size(request.getParameter("p_size")); // amount column
		productDto.setP_color(request.getParameter("p_color")); // amount column
		String spaceReplace = (request.getParameter("p_detail"));
		spaceReplace.replaceAll("(\r\n|\r|\n|\n\r)",",");
		
		productDto.setP_detail(spaceReplace); //띄우기 삭제(상품 구매에서 에러난다고 하기에 처리)
		productDto.setP_category(request.getParameter("p_category"));
		productDto.setP_show_state(request.getParameter("p_show_state"));
		return productDto;
	}

	private boolean productProcess(ProductDTO productDto) {
		boolean result = false;
		ProductDAO productDao = new ProductDAO();
		productDao.insert(productDto);
		int p_id = productDto.getP_id();
		if (p_id > 0) {
			result = true;
		}

		return result;
	}

	private MultipartRequest multi(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MultipartRequest multi = null;

		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			String savePath = "image";
			int uploadFileSizeLimit = 10 * 1024 * 1024;
			String encType = "UTF-8";
			
//			PrintWriter out = response.getWriter();

			ServletContext context = request.getServletContext();
			uploadFilePath = context.getRealPath(savePath);
			
//			System.out.println(uploadFilePath);
			multi = new MultipartRequest(request,

					uploadFilePath,

					uploadFileSizeLimit,

					encType,

					new DefaultFileRenamePolicy());
//			Enumeration<?> files = multi.getFileNames();
//			while (files.hasMoreElements()) {
//				String file = (String) files.nextElement();
//				String file_name = multi.getFilesystemName(file);
//				String ori_file_name = multi.getOriginalFileName(file);
//				out.print("<br>업로드된 파일명 : " + file_name);
//				out.print("<br>업로드된 파일명 : " + ori_file_name);
//				out.print("<hr>");
//
//			}
		} catch (Exception e) {
			System.out.print("예외 발생 : " + e);
		}
		return multi;
	}

	private ArrayList<AmountDTO> buildAmountDtoList(ProductDTO productDto, int amountCount) {
		ArrayList<AmountDTO> amountDtoList = new ArrayList<AmountDTO>();
		String[] sizeSplit = productDto.getP_size().split(",");
		String[] colorSplit = productDto.getP_color().split(",");
		for (int sizeCount = 0; sizeCount < sizeSplit.length; sizeCount++) {
			for (int colorCount = 0; colorCount < colorSplit.length; colorCount++) {
				AmountDTO amountDto = new AmountDTO();
				amountDto.setP_id(productDto.getP_id());
				amountDto.setAmount_size(sizeSplit[sizeCount]);
				amountDto.setAmount_color(colorSplit[colorCount]);
				amountDto.setAmount_count(amountCount);// need to update
				amountDtoList.add(amountDto);
			}
		}
		return amountDtoList;
	}

	private boolean amountProcess(ArrayList<AmountDTO> amountDtoList) {
		boolean result = false;
		AmountDAO amountDao = new AmountDAO();
		int check = amountDao.insert(amountDtoList);
		if (check > 0) {
			result = true;

		}
		return result;
	}

	private boolean addAmountProcess(ArrayList<AddAmountDTO> addAmountList) {
		boolean result = false;
		int check = 0;
		AddAmountDAO addAmountDao = new AddAmountDAO();
		for (AddAmountDTO dto : addAmountList) {
			if (addAmountList.size() != 0) {
				check += addAmountDao.countIncrease(dto);
			} else
				result = true;

		}
		if (check > 0) {
			result = true;
		}

		return result;
	}

	private ArrayList<AddAmountDTO> bulidaddAmountList(ArrayList<AmountDTO> amountList) {
		ArrayList<AddAmountDTO> addAmountList = new ArrayList<AddAmountDTO>();
		for (AmountDTO dto : amountList) {
			if (dto.getAmount_count() != 0) {
				AddAmountDTO addAmountDto = new AddAmountDTO();
				addAmountDto.setAa_Count(dto.getAmount_count());
				addAmountDto.setAmount_id(dto.getAmount_id());
				addAmountList.add(addAmountDto);
			}
		}
		return addAmountList;
	}

}
