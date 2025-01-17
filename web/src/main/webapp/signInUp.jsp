<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%
  Cookie[] cookies = request.getCookies();
  if (cookies != null) {
    for (Cookie cookie : cookies) {
      if ("session".equals(cookie.getName())) {
        response.sendRedirect("userProfile.jsp");
      }
    }
  }
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Document</title>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />

    <style>
      @import url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family: "Poppins", sans-serif !important;
      }
      a {
        text-decoration: none !important;
      }
      body {
        font-family: "Poppins", sans-serif;
      }
      li {
        list-style: none !important;
      }
      .containerLogin {
        position: relative;
        margin: auto;
        background: #ffffff;
        border-radius: 3px;
        width: 80% !important;
        height: 90% !important;
        overflow: hidden;
        box-shadow: 10px 10px 0px #c2c2c2;
      }

      .animateWidth {
        -webkit-animation: animateWidth 0.8s linear forwards;
        animation: animateWidth 0.8s linear forwards;
      }
      @-webkit-keyframes animateWidth {
        0% {
          width: 35%;
        }
        20% {
          width: 50%;
        }
        100% {
          width: 35%;
        }
      }
      @keyframes animateWidth {
        0% {
          width: 35%;
        }
        20% {
          width: 50%;
        }
        100% {
          width: 35%;
        }
      }
      /* <!-- Login Form Start --> */
      .form__container {
        position: absolute;
        z-index: -1;
        display: flex;
        align-items: center;

        width: 65%;
        height: 100%;
        padding: 25px;

        background-color: #243c55;
        transition: all 0.6s ease-in;
      }

      .container .go-register {
        text-align: center;
      }
      .left-column {
        text-align: center;
        padding: 20px;
        color: #243c55;
      }

      .left-column h1 {
        color: #ffffff;
        font-size: 50px;
        font-weight: bolder;
      }

      .left-column p {
        margin-top: 20px;
        color: #ffffff;
        letter-spacing: 1px;
        font-size: 14px;
      }

      .form__container-login input[type="text"],
      .form__container-login input[type="password"] {
        width: 70%;
        padding: 15px;
        margin-top: 20px;
        border: none;
        height: 100%;
        border-bottom: 2px solid #e7e7e7;
        background-color: #ffffff;
      }

      .login-btn {
        /* Center the button horizontally */
        margin-top: 20px;
        width: 50%;
        height: 40px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        cursor: pointer;
        background-color: #ffffff;
        color: #243c55;
        box-shadow: 8px 8px 0px #c2c2c2;
        transition: 0.4s ease-in-out;
      }
      .login-btn:hover {
        box-shadow: 3px 3px 0px #c2c2c2;
        transform: scale(0.98);
      }
      .left-column a {
        cursor: pointer;
      }

      .form__container.form__container-register {
        padding: 0;
      }
      .right-column {
        background-color: #ffffff;
        align-items: center;
      }

      .right-column h2 {
        text-align: center;
        color: #243c55;
        font-size: 2.5em;
        font-weight: bolder;
        margin: 0;
      }

      .right-column p {
        text-align: center;
        color: #243c55;
        justify-content: center;
        align-items: center;
        margin-top: 5px; /* Adjust margin */
      }

      .form-group {
        padding: 20px;
      }

      .form-group input {
        width: calc(50% - 5px);
        margin: 10px 0; /* Adjust margin */
        font-size: 16px;
        height: 45px;
        padding-left: 10px;
        background-color: #243c55;
        color: #ffffff;
        border: none;
        box-sizing: border-box;
      }

      .upload {
        margin-bottom: 20px; /* Add margin bottom */
      }
      .chekckbox {
        margin-left: 30px;
      }
      #checkbox {
        transform: scale(1.5); /* Adjust the scale factor as needed */
        margin-right: 10px;
      }
      #checkbox:checked + .checkbox-custom::before {
        background-color: #243c55;
      }
      .Register-button {
        /* Center the button horizontally */
        margin: 50px 30%;
        /* Set button width */
        width: 50%;
        height: 40px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        cursor: pointer;
        background-color: #243c55;
        color: white;
        box-shadow: 8px 8px rgba(104, 100, 100, 0.479);
        transition: 0.4s ease-in-out;
      }
      .Register-button:hover {
        transform: scale(0.98);
        box-shadow: 3px 3px rgba(104, 100, 100, 0.479);
      }

      #go-register {
        /* Center the button horizontally */
        margin: 50px 30%;
        /* Set button width */
        width: 50%;
        height: 40px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        cursor: pointer;
        background-color: #203c55;
        color: #fff;
        box-shadow: 8px 8px 0px #b5b5b5;
        transition: 0.4s ease-in-out;
      }
      #go-register:hover {
        box-shadow: 3px 3px 0px #b5b5b5;
        transform: scale(0.98);
      }

      .go-login .form__container-login {
        left: 35%;
        opacity: 0;
      }
      .go-register .form__container-login {
        left: 0;
        opacity: 1;
        z-index: 0;
      }
      .go-login .form__container-register {
        left: 35%;
        opacity: 1;
        z-index: 0;
        background-color: #ffffff;
      }
      .go-register .form__container-register {
        left: 0;
        opacity: 0;
      }
      .form {
        width: 100%;
      }
      .form__heading {
        font-size: 40px;
        margin-bottom: 15px;
      }
      .form__field {
        width: 100%;
        height: 35px;
        line-height: 35px;
        padding-left: 15px;
        margin-bottom: 15px;
        background: #f4f8f7;
        border: none;
      }
      .form__field:last-child {
        margin-bottom: 0;
      }
      .form__field::-webkit-input-placeholder {
        text-transform: capitalize;
      }
      .form__field::-moz-placeholder {
        text-transform: capitalize;
      }
      .form__field:-ms-input-placeholder {
        text-transform: capitalize;
      }
      .form__field:-moz-placeholder {
        text-transform: capitalize;
      }
      .form__field:focus,
      .form__field:active {
        outline: 0;
      }
      .form__text {
        margin-bottom: 15px;
        font-size: 14px;
      }

      .list {
        padding-left: 0;
      }
      .list__inline {
        margin-bottom: 15px;
      }
      .list__inline .list__item {
        display: inline-block;
        margin-left: 5px;
        margin-right: 5px;
        border: 1px solid #333;
        width: 30px;
        height: 30px;
        border-radius: 50%;
      }
      .list__inline .list__link {
        color: #333;
        text-decoration: none;
      }
      .list__inline .list__icon {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100%;
      }

      /* <!-- Overlay container Start--> */

      .overlay-container {
        position: absolute;
        right: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
        width: 35%;
        text-align: center;
        background-color: #ffffff;
        transition: all 0.8s cubic-bezier(0.67, 0.67, 0.34, 0.95);
      }
      .go-login .overlay-container {
        right: 65%;
        background-color: #203c55;
      }
      .go-register .overlay-container {
        right: 0;
      }

      .overlay {
        padding: 25px;
        color: #243c55;
        position: absolute;
        width: 100%;
      }
      .overlay__heading {
        color: #203c55;
        font-size: 50px;
        font-weight: bolder;
        margin-bottom: 15px;
      }
      .overlay__desc {
        width: 100%;
        margin: auto;
        margin-bottom: 4px;
        text-align: center;
      }
      .overlay--left {
        opacity: 0;
        z-index: 99;
      }
      #go-login {
        /* Center the button horizontally */
        margin: 50px 0%;
        /* Set button width */
        width: 50%;
        height: 40px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        cursor: pointer;
        background-color: #ffffff;
        color: #243c55;
        box-shadow: 8px 8px 0px #b5b5b5;
        transition: 0.4s ease-in-out;
      }
      #go-login:hover {
        box-shadow: 3px 3px 0px #b5b5b5;
        transform: scale(0.98);
      }

      .go-login .overlay--left {
        z-index: 99;
        opacity: 1;
        padding: 50px;
      }
      .go-register .overlay--left {
        opacity: 0;
        z-index: -1;
      }
      .overlay--right {
        opacity: 0;
        z-index: 99;
      }
      .go-login .overlay--right {
        opacity: 0;
        z-index: -1;
      }
      .go-register .overlay--right {
        z-index: 99;
        opacity: 1;
      }
      .regInput::placeholder {
        color: rgba(255, 255, 255, 0.615) !important;
      }
    </style>
  </head>

  <body>
    <%@include file="header.html"%>

    <div
      style="
        background-color: #e7e7e7;
        width: 100%;
        height: 90vh;
        display: flex;
        align-items: center;
      "
    >
      <div class="containerLogin go-register">
        <!-- Login Form Start -->
        <div class="form__container form__container-login">
          <form class="form formLogin">
            <div class="left-column">
              <h1>Login your Account</h1>
              <p style="margin-top: 15px">Welcome back</p>
              <p style="margin-top: 1px">Glad to see you again!</p>
              <div style="margin-top: 50px; margin-bottom: 60px">
                <input
                  type="text"
                  name="email"
                  id="username"
                  placeholder="Enter your Email"
                  required
                />
                <br />
                <input
                  type="password"
                  id="pwd"
                  name="password"
                  placeholder="Enter your password"
                  required
                /><br />
              </div>

              <button class="login-btn" id="loginRegisterBtn" type="submit">
                Login</button
              ><br />
              <a href="#"><p style="font-size: 14px">Forgot Password ?</p></a>
            </div>
          </form>
        </div>

        <!-- Login Form End -->

        <!-- Register Form Start -->

        <div class="form__container form__container-register">
          <form class="form formRegister">
            <div class="right-column">
              <h2 style="margin-top: 50px; margin-bottom: -5px">
                Create Your Account
              </h2>
              <p style="margin-bottom: -10px">
                <span class="subhed">Set up your details</span>
              </p>
              <div class="form-group">
                <input
                  class="regInput"
                  type="text"
                  id="fname"
                  name="username"
                  required
                  placeholder="Enter your first name"
                />
                <input
                  class="regInput"
                  type="text"
                  id="lname"
                  name="name"
                  required
                  placeholder="Enter your last name"
                  style="margin-left: 5px"
                />
                <br />
                <input
                  class="regInput"
                  type="email"
                  id="email"
                  name="email"
                  required
                  placeholder="Enter your email"
                />
                <input
                  class="regInput"
                  type="text"
                  id="number"
                  name="number"
                  required
                  placeholder="Enter your Contact Number"
                  style="margin-left: 5px"
                />
                <input
                  class="regInput"
                  style="width: 100%"
                  type="text"
                  id="addres"
                  name="addres"
                  required
                  placeholder="Enter your Address"
                />
                <br />
                <div
                  class="upload"
                  style="height: fit-content !important; margin-bottom: -2px"
                >
                  <div
                    class="input-group"
                    style="padding: 0 !important; align-items: center"
                  >
                    <input
                      style="border-radius: 0px !important"
                      type="file"
                      class="form-control hidden"
                      id="inputGroupFile01"
                      name="profilePicture"
                    />
                  </div>
                </div>
                <input
                  class="regInput"
                  type="password"
                  id="pwd"
                  name="password"
                  required
                  placeholder="Password"
                />
                <input
                  class="regInput"
                  type="password"
                  id="confirmPwd"
                  name="confirmPwd"
                  required
                  placeholder="Confirm password"
                  style="margin-left: 5px"
                />
              </div>
              <div class="chekckbox" style="margin-bottom: -30px">
                <input
                  type="checkbox"
                  name="termsAndConditions"
                  id="checkbox"
                  required
                />
                <label class="checkbox-text"
                  >Accept our terms and conditions</label
                >
                <br />
              </div>

              <button class="Register-button" type="submit">Register</button>
            </div>
          </form>
        </div>
        <!-- Register Form End -->

        <!-- Overlay container Start-->
        <div class="overlay-container">
          <!-- Right Overlay Start -->
          <div class="overlay overlay--right">
            <h3 class="overlay__heading">New Here ?</h3>
            <p class="overlay__desc">Sign up and discover a great</p>
            <p class="overlay__desc">amount of new fashion!</p>
            <button type="button" id="go-register" class="btn--main-outline">
              Sign Up
            </button>
          </div>
          <!-- Right Overlay End -->

          <!-- Left Overlay Start -->
          <div class="overlay overlay--left">
            <h3 class="overlay__heading" style="color: #ffffff">Welcome</h3>
            <h3
              class="overlay__heading"
              style="color: #ffffff; margin-top: -32px"
            >
              Back!
            </h3>
            <p class="overlay__desc" style="color: #ffffff">
              To keep connected with us please with your personal info
            </p>
            <button type="button" id="go-login" class="btn--main-outline">
              Login
            </button>
          </div>
          <!-- Left Overlay End -->
        </div>

        <!-- Overlay Container End -->
      </div>
    </div>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        // Function to toggle between login and register forms
        const _toggleForm = () => {
          const $goLogin = document.querySelector("#go-login");
          const $goRegister = document.querySelector("#go-register");
          const $container = document.querySelector(".containerLogin");
          const $overlayContainer =
            document.querySelector(".overlay-container");

          if ($container.classList.contains("go-register")) {
            $container.classList.remove("go-register");
            $container.classList.add("go-login");
            $overlayContainer.classList.add("animateWidth");
            $overlayContainer.addEventListener("webkitTransitionEnd", () =>
              $overlayContainer.classList.remove("animateWidth")
            );
          } else {
            $container.classList.remove("go-login");
            $container.classList.add("go-register");
            $overlayContainer.classList.add("animateWidth");
            $overlayContainer.addEventListener("webkitTransitionEnd", () =>
              $overlayContainer.classList.remove("animateWidth")
            );
          }
        };

        // Event listeners for login and register buttons
        const $goLogin = document.querySelector("#go-login");
        const $goRegister = document.querySelector("#go-register");
        $goLogin.addEventListener("click", _toggleForm);
        $goRegister.addEventListener("click", _toggleForm);

        // Event listener for form submission
        const formEl = document.querySelector(".formLogin");
        formEl.addEventListener("submit", (event) => {
          event.preventDefault();

          const formData = new FormData(formEl);
          const data = Object.fromEntries(formData);

          fetch("http://localhost:8080/web/auth/login", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify(data),
          })
            .then((res) => res.json())
                  .then((data) => {
                    console.log(data);
                    const status = data.status;
                    const message = data.message;
                    var BASE_URL = 'http://localhost:8080/web';
                    if(status === 'OK'){
                      window.location.href = BASE_URL + '/index.jsp';
                    }else{
                      alert("Status: " + status + "\nMessage: " + message);
                    }

                  })
            .catch((err) => console.log(err));
        });

        // Event listener for register form submission
        const formEl2 = document.querySelector(".formRegister");
        formEl2.addEventListener("submit", (event) => {
          event.preventDefault();

          const formData = new FormData(formEl2);
          const jsonobject = Object.fromEntries(formData);
          console.log(jsonobject);
          fetch("http://localhost:8080/web/auth/register", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify(jsonobject),
          })
            .then((res) => res.json())
            .then((data) => {
              console.log(data);
              const status = data.status;
              const message = data.message;
              var BASE_URL = 'http://localhost:8080/web';
              if(status === 'OK'){
                window.location.href = BASE_URL + '/signInUp.jsp';
              }else{
                alert("Status: " + status + "\nMessage: " + message);
              }

            })
            .catch((err) => console.log(err));
        });
      });
    </script>

    <%@include file="footer.html"%>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
