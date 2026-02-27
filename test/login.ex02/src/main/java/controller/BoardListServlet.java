package controller;

/*
 * 브라우저
   ↓  (GET 요청)
/board/list
   ↓
BoardListServlet 실행
   ↓
DAO → DB 조회
   ↓
request에 데이터 저장
   ↓
list.jsp로 forward
   ↓
JSP에서 EL로 출력
 * */




//본 서블릿은 게시글 목록을 조회하는 Controller 역할을 수행한다.
//DAO를 통해 데이터베이스에서 게시글 목록을 가져오고,
//조회된 데이터를 request 영역에 저장한 뒤 JSP로 전달하여 화면에 출력하도록 한다.
// DAO는 왜 따로 분리하는가?
//→ 역할 분리 (유지보수, 재사용성)

// DTO는 왜 필요한가?
//→ 한 행(row)의 데이터를 객체로 묶기 위함

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.BoardBean;

@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. DAO 객체 생성 (비즈니스 로직 호출 전담)
        BoardDAO dao = new BoardDAO();

        // 2. DAO를 통해 데이터 목록(Model)을 가져옴
        List<BoardBean> list = dao.getBoardList();

        // 3. 결과 데이터를 request 객체에 담음 (→ JSP(View)에서 사용할 수 있도록 전달 준비)
        request.setAttribute("list", list);
        // 게시글 개수도 함께 전달
        request.setAttribute("count", list.size());

        // 4. View(JSP)로 포워딩→ 클라이언트 주소는 그대로 유지→ request 영역 데이터 유지
        request.getRequestDispatcher("/view/board/list.jsp").forward(request, response);
    }
}
