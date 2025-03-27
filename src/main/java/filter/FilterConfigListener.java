package filter;

import jakarta.servlet.FilterRegistration;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

// Đây là class đăng ký thứ tự filter nào sẽ xử lý trước sau.
public class FilterConfigListener implements ServletContextListener {
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		ServletContext ctx = sce.getServletContext();
		final FilterRegistration.Dynamic loginFilter = ctx.addFilter("LoginFilter", new LoginFilter());
		loginFilter.addMappingForUrlPatterns(null, false, "/checkout", "/confirm");
		
		final FilterRegistration.Dynamic activateFilter = ctx.addFilter("ActivateFilter", new ActivateFilter());
		activateFilter.addMappingForUrlPatterns(null, true, "/checkout", "/confirm");
	}

}
