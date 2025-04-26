package admin.api;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import service.GrantResourceService;
import service.IGrantResourceService;

@WebServlet("/root/grant")
public class GrantPermissionsAPI extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IGrantResourceService grantResourceService;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			response.put("message", "userId không được null");
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
		grantResourceService.grant(userId, permissionMap);
		response.put("status", "success");
		sendResponse(resp, response);

	}

	private void sendResponse(HttpServletResponse resp, Map<String, String> response) throws IOException {
		JsonObjectBuilder errorResponse = Json.createObjectBuilder();
		errorResponse.add("status", "error");
		errorResponse.add("message", "userId không được null");
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(errorResponse.build().toString());
	}
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		grantResourceService = new GrantResourceService();
	}
}
