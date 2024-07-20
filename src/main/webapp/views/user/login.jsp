<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@ include file="/common/headLogin.jsp" %>
</head>

<body>
	<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="<c:url value='/template/user/img/phim-hai.png'/>"
          class="img-fluid rounded-4  shadow-4" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        <form id="login-form" action="login" method="POST">
          <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
            <p class="lead fw-normal mb-0 me-3">Login with</p>
            <button type="button" class="btn btn-floating mx-1">
              <i class="bi bi-facebook" ></i>
            </button>

            <button type="button" class="btn btn-floating mx-1">
              <i class="bi bi-twitter"></i>
            </button>

            <button type="button" class="btn btn-floating mx-1">
              <i class="bi bi-linkedin"></i>
            </button>
          </div>

          <div class="divider d-flex align-items-center my-4">
            <p class="text-center fw-bold mx-3 mb-0">Or</p>
          </div>

          <!-- Email input -->
          <div class="form-outline mb-4">
           <label class="form-label" for="form3Example3">User Name</label>
            <input type="username" name="username" id="form3Example3" class="form-control form-control-lg"
              placeholder="Enter Username" />
           
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
           <label class="form-label" for="form3Example4">Password</label>
            <input type="password" name="password" id="form3Example4" class="form-control form-control-lg"
              placeholder="Enter password" />
           
          </div>


          <div class="text-center text-lg-start mt-4 pt-2">
            <button type="submit" class="btn btn-login btn-lg"
              style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
            <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? 
            <a href="<c:url value='signup'/>"
                class="link-danger">Register</a></p>
          </div>

        </form>
      </div>
    </div>
  </div>
  
</section>


</body>
</html>