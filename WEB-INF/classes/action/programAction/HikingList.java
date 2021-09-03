package action.programAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.programService.HikingListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ProgramBean;

public class HikingList implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ArrayList<ProgramBean> hikingList = new ArrayList<ProgramBean>();
		int page = 1;
		int limit = 6;
		String category = null;
		 category = request.getParameter("category");
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			
		}

		HikingListService hikingListService = new HikingListService();

		int listCount = hikingListService.getListCount(category); // 총 리스트 수를 받아옴.
		hikingList = hikingListService.getHikingList(page, limit); // 리스트를 받아옴.
		// 총 페이지 수.
		int maxPage = (int) ((double) listCount / limit + 0.95); // 0.95를 더해서 올림 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startPage = (((int) ((double) page / 5 + 0.9)) - 1) * 5 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endPage = startPage+5-1;

		if (endPage > maxPage)
			endPage = maxPage;

		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("hikingList", hikingList);
		request.setAttribute("category", category);
		ActionForward forward = new ActionForward();
		forward.setPath("/WEB-INF/program/hikingList.jsp");
		return forward;

	}

}