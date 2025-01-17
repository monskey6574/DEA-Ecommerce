package nsbm.dea.web.servlets.auth.check;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import nsbm.dea.web.dao.UserDAO;
import nsbm.dea.web.enums.Status;
import nsbm.dea.web.lib.Lib;

@WebServlet(name = "check_username", value = "/auth/check/username")
public class Username extends HttpServlet {
  private class Data {
    @NotNull(message = "username cannot be empty")
    @NotBlank(message = "username cannot be empty")
    @Size(min = 3, message = "username must be larger than 3 characters")
    @Size(max = 40, message = "username should not be larger than 20 characters")
    @Pattern(regexp = "^[a-zA-Z0-9_-]+$", message = "username is not valid")
    private String username;

    public String getUsername() {
      return username;
    }

    public void setUsername(String username) {
      this.username = username;
    }
  }

  private void sendResponse(HttpServletResponse response, int code, Status status, boolean isUsernameAvailable)
      throws IOException {
    response.setContentType("application/json");
    response.setStatus(HttpServletResponse.SC_OK);
    PrintWriter out = response.getWriter();

    JsonObject object = new JsonObject();
    object.addProperty("is_username_available", isUsernameAvailable);
    object.addProperty("status", status.toString());
    out.println(object.toString());
    return;
  }

  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    try {
      JsonObject payload = Lib.getJSONPayloadFromRequest(request);
      Data data = new Data();

      try (ValidatorFactory factory = Validation.buildDefaultValidatorFactory()) {
        Validator validator = factory.getValidator();

        data.setUsername(payload.get("username").getAsString());

        Set<ConstraintViolation<Data>> violations = validator.validate(data);
        if (!violations.isEmpty()) {
          this.sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, Status.USERNAME_NOT_VALID, false);
          return;
        }
      } catch (Exception e) {
        e.printStackTrace();
        Lib.sendJSONResponse(response, HttpServletResponse.SC_BAD_REQUEST, Status.BAD_REQUEST, "bad request");
        return;
      }

      UserDAO userDAO = new UserDAO();
      if (!userDAO.isUsernameAvailable(data.getUsername())) {
        this.sendResponse(response, HttpServletResponse.SC_OK, Status.OK, false);
        return;
      }

      this.sendResponse(response, HttpServletResponse.SC_OK, Status.OK, true);
      return;
    } catch (Exception e) {
      e.printStackTrace();
      this.sendResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, Status.INTERNAL_SERVER_ERROR, false);
      return;
    }
  }
}
