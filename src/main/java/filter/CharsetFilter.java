package filter;

import java.io.IOException;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebFilter(filterName = "charset")
public class CharsetFilter extends HttpFilter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// Set mã hóa cho request
		req.setCharacterEncoding("UTF-8");

        // Set mã hóa cho response
		res.setCharacterEncoding("UTF-8");
        chain.doFilter(req, res);
	}
}
