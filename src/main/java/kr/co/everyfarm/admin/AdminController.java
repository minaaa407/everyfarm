package kr.co.everyfarm.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.everyfarm.board.PageMaker;
import kr.co.everyfarm.board.Paging;
import kr.co.everyfarm.farmer.FarmerBean;
import kr.co.everyfarm.farmer.FarmerDAO;
import kr.co.everyfarm.payment.PaymentDAO;
import kr.co.everyfarm.product.ProductDao;
import kr.co.everyfarm.user.MemberBean;
import kr.co.everyfarm.user.MemberDAO;
import kr.co.everyfarm.user.UserPw;

@Controller
public class AdminController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model, FarmerBean farmerBean, MemberBean memberBean) {

		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		AdminDAO adDAO = sqlSessionTemplate.getMapper(AdminDAO.class);

		int mmonth = 0;
		int fmonth = 0;

		List<Integer> mMonth = new ArrayList<Integer>();
		List<Integer> fMonth = new ArrayList<Integer>();

		for (int i = 0; i < 12; i++) {
			mmonth = adDAO.mchart(i);

			mMonth.add(mmonth);
		}

		Calendar cal = Calendar.getInstance();

		for (int j = 0; j < 12; j++) {
			fmonth = adDAO.fchart(j);
			fMonth.add(fmonth);
		}

		model.addAttribute("mMonth", mMonth);
		model.addAttribute("fMonth", fMonth);

		// 상품 차트
		ProductDao productdao = sqlSessionTemplate.getMapper(ProductDao.class);
		int year2 = cal.get(Calendar.YEAR);

		String[] months = { "January", "february", "march", "april", "may", "june", "july", "august", "september",
				"october", "november", "december" };
		int[] payment = new int[12];
		int[] payment1 = new int[12];
		int[] payment2 = new int[12];
		for (int i = 0; i < months.length; i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("Month", months[i]);
			map.put("year", year2);
			payment[i] = productdao.adminproductpaymentchart(map);
		}
		model.addAttribute("payment", payment);

		for (int i = 0; i < months.length; i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("Month", months[i]);
			map.put("year", year2 - 1);
			payment1[i] = productdao.adminproductpaymentchart(map);
		}
		model.addAttribute("payment1pre", payment1);

		for (int i = 0; i < months.length; i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("Month", months[i]);
			map.put("year", year2 - 2);
			payment2[i] = productdao.adminproductpaymentchart(map);
		}
		model.addAttribute("payment2pre", payment2);

		// 상품차트

		return "admin/admin";
	}

	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public String alogin() {
		return "admin/sign-in";
	}

	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String alogin(AdminBean adminBean, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		HttpSession session = request.getSession();
		AdminDAO adminDAO = sqlSessionTemplate.getMapper(AdminDAO.class);

		System.out.println("첫번째:" + adminBean.getA_Pw());
		String encryPassword = UserPw.encrypt(adminBean.getA_Pw());
		adminBean.setA_Pw(encryPassword);
		System.out.println("두번째:" + adminBean.getA_Pw());

		AdminBean admin = adminDAO.alogin(adminBean);

		if (admin != null) {
			session.setAttribute("admin", admin);
			return "redirect:/admin";
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디 혹은 비밀번호가 일치하지 않습니다. 다시 확인해주세요.'); history.back();</script>");
			out.flush();
			return null;
		}
	}

	@RequestMapping(value = "/userList")
	public String mlist(Model model, Paging paging, MemberBean memberBean) {
		AdminDAO dao = sqlSessionTemplate.getMapper(AdminDAO.class);

		int total = dao.mCount(paging);

		PageMaker pageMake = new PageMaker(paging, total);
		model.addAttribute("member", dao.mlist(paging));
		model.addAttribute("pageMaker", pageMake);
		return "admin/userList";
	}

	@RequestMapping(value = "/farmerList", method = RequestMethod.GET)
	public String flist(Model model, Paging paging, FarmerBean farmerBean) {
		AdminDAO dao = sqlSessionTemplate.getMapper(AdminDAO.class);

		int total = dao.fCount(paging);

		PageMaker pageMake = new PageMaker(paging, total);
		model.addAttribute("farmer", dao.flist(paging));
		model.addAttribute("pageMaker", pageMake);
		return "admin/farmerList";
	}

	@RequestMapping(value = "/adminLogout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:/adminLogin";
	}

	@RequestMapping(value = "/farmerAdd", method = RequestMethod.GET)
	public String farmerAdd(Model model) {
		model.addAttribute("farmerBean", new FarmerBean());
		return "admin/farmerTest";
	}

	@RequestMapping(value = "/farmerAdd", method = RequestMethod.POST)
	public String farmerAdd(FarmerBean farmerBean, BindingResult bindingResult, HttpServletRequest request) {

		System.out.println("첫번째:" + farmerBean.getF_Pw());
		String encryPassword = UserPw.encrypt(farmerBean.getF_Pw());
		farmerBean.setF_Pw(encryPassword);
		System.out.println("두번째:" + farmerBean.getF_Pw());

		FarmerDAO farmerDAO = sqlSessionTemplate.getMapper(FarmerDAO.class);
		farmerDAO.farmerAdd(farmerBean);

		if (bindingResult.hasErrors()) {
			return "admin/farmerTest";
		}
		return "redirect:/farmerList";
	}

	@RequestMapping(value = "/userAdd", method = RequestMethod.GET)
	public String userAdd(Model model) {
		model.addAttribute("memberBean", new MemberBean());
		return "admin/userTest";
	}

	@RequestMapping(value = "/userAdd", method = RequestMethod.POST)
	public String userAdd(MemberBean memberBean, BindingResult bindingResult, HttpServletRequest request) {

		System.out.println("첫번째:" + memberBean.getM_Pw());
		String encryPassword = UserPw.encrypt(memberBean.getM_Pw());
		memberBean.setM_Pw(encryPassword);
		System.out.println("두번째:" + memberBean.getM_Pw());

		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		memberDAO.userAdd(memberBean);

		if (bindingResult.hasErrors()) {
			return "admin/userTest";
		}
		return "redirect:/userList";
	}

	@RequestMapping(value = "/userDelete")
	@ResponseBody
	public Map<String, Object> userDelete(MemberBean memberbean, @RequestParam(value = "checkArr[]") String checkArr) {

		Map<String, Object> map = new HashMap<String, Object>();
		MemberDAO memDao = sqlSessionTemplate.getMapper(MemberDAO.class);

		List<String> delete = Arrays.asList(checkArr);

		try {
			memDao.uDelete(delete);
			map.put("error", true);
		} catch (Exception e) {
			map.put("error", false);
		}
		return map;
	}

	@RequestMapping(value = "/farmerD")
	@ResponseBody
	public Map<String, Object> farmerDelete(FarmerBean farmerbean, @RequestParam(value = "checkArr[]") String checkArr) {

		Map<String, Object> map = new HashMap<String, Object>();
		FarmerDAO farmDao = sqlSessionTemplate.getMapper(FarmerDAO.class);

		List<String> delete = Arrays.asList(checkArr);
		
		try {
			farmDao.fDel(delete);
			map.put("error", true);
		} catch (Exception e) {
			map.put("error", false);
		}
		return map;
	}

	@RequestMapping(value = "/farmerY")
	@ResponseBody
	public Map<String, Object> farmerY(FarmerBean farmerBean, @RequestParam(value = "checkArr[]") String checkArr) {

		Map<String, Object> map = new HashMap<String, Object>();
		AdminDAO farmDao = sqlSessionTemplate.getMapper(AdminDAO.class);

		List<String> yes = Arrays.asList(checkArr);
		farmDao.farmerY(yes);
		map.put("error", true);

		return map;
	}

	@RequestMapping(value = "/iTest", method = RequestMethod.GET)
	public String iTest(Model model, FarmerBean farmerBean, MemberBean memberBean) {
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);

		DecimalFormat dfmonth = new DecimalFormat("00");
		DecimalFormat dfyear = new DecimalFormat("0000");
		Calendar cal = Calendar.getInstance();
		String year = dfyear.format(cal.get(Calendar.YEAR));
		String date = dfmonth.format(cal.get(Calendar.MONTH) + 1);
		String monthago1 = dfmonth.format(cal.get(Calendar.MONTH));
		String monthago2 = dfmonth.format(cal.get(Calendar.MONTH) - 1);
		String monthago3 = dfmonth.format(cal.get(Calendar.MONTH) - 2);
		String monthago4 = dfmonth.format(cal.get(Calendar.MONTH) - 3);
		String monthago5 = dfmonth.format(cal.get(Calendar.MONTH) - 4);
		String monthago6 = dfmonth.format(cal.get(Calendar.MONTH) - 5);
		String monthago7 = dfmonth.format(cal.get(Calendar.MONTH) - 6);
		String monthago8 = dfmonth.format(cal.get(Calendar.MONTH) - 7);

		model.addAttribute("year", year);
		model.addAttribute("date", date);
		model.addAttribute("monthago1", monthago1);
		model.addAttribute("monthago2", monthago2);
		model.addAttribute("monthago3", monthago3);
		model.addAttribute("monthago4", monthago4);
		model.addAttribute("monthago5", monthago5);
		model.addAttribute("monthago6", monthago6);
		model.addAttribute("monthago7", monthago7);
		model.addAttribute("monthago8", monthago8);

		Integer countA = dao.countA(date);
		int countAA = 0;
		if (countA != null) {
			countAA = dao.countA(date);
		}
		Integer countB = dao.countB(date);
		int countBB = 0;
		if (countB != null) {
			countBB = dao.countB(date);
		}
		Integer countC = dao.countC(date);
		int countCC = 0;
		if (countC != null) {
			countCC = dao.countC(date);
		}
		Integer countD = dao.countD(date);
		int countDD = 0;
		if (countD != null) {
			countDD = dao.countD(date);
		}
		Integer countE = dao.countE(date);
		int countEE = 0;
		if (countE != null) {
			countEE = dao.countE(date);
		}
		Integer countF = dao.countF(date);
		int countFF = 0;
		if (countF != null) {
			countFF = dao.countF(date);
		}
		Integer countG = dao.countG(date);
		int countGG = 0;
		if (countG != null) {
			countGG = dao.countG(date);
		}
		Integer countH = dao.countH(date);
		int countHH = 0;
		if (countH != null) {
			countHH = dao.countH(date);
		}
		Integer countI = dao.countI(date);
		int countII = 0;
		if (countI != null) {
			countII = dao.countI(date);
		}
		Integer countJ = dao.countJ(date);
		int countJJ = 0;
		if (countJ != null) {
			countJJ = dao.countJ(date);
		}
		Integer countK = dao.countK(date);
		int countKK = 0;
		if (countK != null) {
			countKK = dao.countK(date);
		}
		Integer countL = dao.countL(date);
		int countLL = 0;
		if (countL != null) {
			countLL = dao.countL(date);
		}
		Integer countM = dao.countM(date);
		int countMM = 0;
		if (countM != null) {
			countMM = dao.countM(date);
		}
		Integer countN = dao.countN(date);
		int countNN = 0;
		if (countN != null) {
			countNN = dao.countN(date);
		}
		Integer countO = dao.countO(date);
		int countOO = 0;
		if (countO != null) {
			countOO = dao.countO(date);
		}

		int[] array = { countAA, countBB, countCC, countDD, countEE, countFF, countGG, countHH, countII, countJJ,
				countKK, countLL, countMM, countNN, countOO };


		for (int i = 0; i < array.length; i++) {
			model.addAttribute("array0", array[0]);
			model.addAttribute("array1", array[1]);
			model.addAttribute("array2", array[2]);
			model.addAttribute("array3", array[3]);
			model.addAttribute("array4", array[4]);
			model.addAttribute("array5", array[5]);
			model.addAttribute("array6", array[6]);
			model.addAttribute("array7", array[7]);
			model.addAttribute("array8", array[8]);
			model.addAttribute("array9", array[9]);
			model.addAttribute("array10", array[10]);
			model.addAttribute("array11", array[11]);
			model.addAttribute("array12", array[12]);
			model.addAttribute("array13", array[13]);
			model.addAttribute("array14", array[14]);
		}
		return "admin/iTest";
	}

	@RequestMapping(value = "/iTest", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> iTest(@RequestParam String selectmonth, Model model, HttpServletResponse response,
			FarmerBean farmerBean, MemberBean memberBean) {

		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);

		Map<String, Object> map = new HashMap<String, Object>();

		if (selectmonth == null) {
			map.put("url", "admin");
			map.put("error", false);
		} else {

			model.addAttribute("selectmonth", selectmonth);

			Integer countA = dao.countA(selectmonth);
			int countAA = 0;
			if (countA != null) {
				countAA = dao.countA(selectmonth);
			}
			Integer countB = dao.countB(selectmonth);
			int countBB = 0;
			if (countB != null) {
				countBB = dao.countB(selectmonth);
			}
			Integer countC = dao.countC(selectmonth);
			int countCC = 0;
			if (countC != null) {
				countCC = dao.countC(selectmonth);
			}
			Integer countD = dao.countD(selectmonth);
			int countDD = 0;
			if (countD != null) {
				countDD = dao.countD(selectmonth);
			}
			Integer countE = dao.countE(selectmonth);
			int countEE = 0;
			if (countE != null) {
				countEE = dao.countE(selectmonth);
			}
			Integer countF = dao.countF(selectmonth);
			int countFF = 0;
			if (countF != null) {
				countFF = dao.countF(selectmonth);
			}
			Integer countG = dao.countG(selectmonth);
			int countGG = 0;
			if (countG != null) {
				countGG = dao.countG(selectmonth);
			}
			Integer countH = dao.countH(selectmonth);
			int countHH = 0;
			if (countH != null) {
				countHH = dao.countH(selectmonth);
			}
			Integer countI = dao.countI(selectmonth);
			int countII = 0;
			if (countI != null) {
				countII = dao.countI(selectmonth);
			}
			Integer countJ = dao.countJ(selectmonth);
			int countJJ = 0;
			if (countJ != null) {
				countJJ = dao.countJ(selectmonth);
			}
			Integer countK = dao.countK(selectmonth);
			int countKK = 0;
			if (countK != null) {
				countKK = dao.countK(selectmonth);
			}
			Integer countL = dao.countL(selectmonth);
			int countLL = 0;
			if (countL != null) {
				countLL = dao.countL(selectmonth);
			}
			Integer countM = dao.countM(selectmonth);
			int countMM = 0;
			if (countM != null) {
				countMM = dao.countM(selectmonth);
			}
			Integer countN = dao.countN(selectmonth);
			int countNN = 0;
			if (countN != null) {
				countNN = dao.countN(selectmonth);
			}
			Integer countO = dao.countO(selectmonth);
			int countOO = 0;
			if (countO != null) {
				countOO = dao.countO(selectmonth);
			}

			int[] array = { countAA, countBB, countCC, countDD, countEE, countFF, countGG, countHH, countII, countJJ,
					countKK, countLL, countMM, countNN, countOO };


			map.put("sarray0", array[0]);
			map.put("sarray1", array[1]);
			map.put("sarray2", array[2]);
			map.put("sarray3", array[3]);
			map.put("sarray4", array[4]);
			map.put("sarray5", array[5]);
			map.put("sarray6", array[6]);
			map.put("sarray7", array[7]);
			map.put("sarray8", array[8]);
			map.put("sarray9", array[9]);
			map.put("sarray10", array[10]);
			map.put("sarray11", array[11]);
			map.put("sarray12", array[12]);
			map.put("sarray13", array[13]);
			map.put("sarray14", array[14]);
			map.put("error", true);
		}
		return map;
	}

}
