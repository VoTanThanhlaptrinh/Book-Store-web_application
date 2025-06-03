package admin.api;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import jakarta.json.Json;
import jakarta.json.JsonArray;
import jakarta.json.JsonObject;
import jakarta.json.JsonObjectBuilder;
import jakarta.json.JsonReader;
import jakarta.json.JsonString;
import jakarta.json.JsonValue;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Log;
import models.User;
import service.GrantResourceService;
import service.IGrantResourceService;
import service.ILogService;
import service.LogServiceImpl;

@WebServlet("/root/grant")
public class GrantPermissionsAPI extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IGrantResourceService grantResourceService;
	private ILogService logService;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi"; // nếu null thiết lập mặc định là 'vi'
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		User user = (User) session.getAttribute("user");
		Map<String, String> response = new HashMap<String, String>();
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = req.getReader().readLine()) != null) {
			sb.append(line);
		}
		JsonReader jsonReader = Json.createReader(new StringReader(sb.toString()));

		JsonObject jsonObject = jsonReader.readObject();
		int userId = Integer.valueOf(jsonObject.getString("userId"));
		if (userId < 1) {
			response.put("status", "error");
			response.put("message", "grant.user.id.null");
			sendResponse(resp, response);
			return;
		}

		JsonArray array = jsonObject.getJsonArray("permissions");
		Map<String,ArrayList<Integer>> permissionMap = new HashMap<>();

		for (JsonValue val : array) {
			if (val.getValueType() == JsonValue.ValueType.STRING) {
				String entry = ((JsonString) val).getString();
				String[] parts = entry.split(":"); // tách thành 2 phần
		        if (parts.length == 2) {
		            String key = parts[0].trim();
		            int value = Integer.valueOf(parts[1].trim());

		            // Lấy list từ map, nếu không có thì tạo mới
		            List<Integer> actions = permissionMap.computeIfAbsent(key, e -> new ArrayList<>());
		            actions.add(value);
		        }
			}
		}
		grantResourceService.grant(userId, permissionMap,bundle);
		response.put("status", "success");
		response.put("message", bundle.getString("grant.success"));
		logService.info(new Log(user.getUserId(), "infor", "User", "/root/grant", "Cấp quyền user thành công"));
		sendResponse(resp, response);
	}

	private void sendResponse(HttpServletResponse resp, Map<String, String> response) throws IOException {
		JsonObjectBuilder res = Json.createObjectBuilder();
		res.add("status", response.get("status"));
		res.add("message", response.get("message"));
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(res.build().toString());
	}
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		grantResourceService = new GrantResourceService();
		logService = new LogServiceImpl();
	}
}
