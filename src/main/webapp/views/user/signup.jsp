<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Sign Up</title>


<%@ include file="/common/headSignup.jsp"%>

<style>
.cascading-right {
	margin-right: -50px;
}

@media ( max-width : 991.98px) {
	.cascading-right {
		margin-right: 0;
	}
}
a{
text-decoration: none;
}
</style>

</head>

<body>

	<!-- Section: Design Block -->
	<section class="text-center text-lg-start">


		<!-- Jumbotron -->
		<div class="container py-4">
			<div class="row g-0 align-items-center">
				<div class="col-lg-6 mb-5 mb-lg-0">
					<div class="card cascading-right"
						style="background: hsla(0, 0%, 100%, 0.55); backdrop-filter: blur(30px);">
						<div class="card-body p-5 shadow-5 text-center">
							<h2 class="fw-bold mb-5">Sign up now</h2>
							
							<form id="signup-form" action="signup" method="POST">
								<!-- 2 column grid layout with text inputs for the first and last names -->


								<div class="form-outline mb-4">
									<label class="form-label" for="form3Example1">User name</label>
									<input name="username" type="text" id="form3Example3" placeholder="Username"
										class="form-control" />
								</div>

								<!-- Email input -->
								<div class="form-outline mb-4">
									<label class="form-label" for="form3Example2">Email
										address </label> <input type="text" name="email" id="form3Example3" placeholder="Email"
										class="form-control" />
								</div>

								<!-- Password input -->
								<div class="form-outline mb-4">
									<label class="form-label" for="form3Example3">Password</label>
									<input type="password" name="password" id="form3Example4" placeholder="Password"
										class="form-control" />
								</div>
								<!-- Confirm Password input -->
								<div class="form-outline mb-4">
								<label class="form-label" for="form3Example3">Confirm Password</label>
								<input type="password" name="cfmPass" id="form3Example5" placeholder="Confirm Password"
										class="form-control" />
								</div>

								<!-- Submit button -->

								<button type="submit" class="btn btn-signup mb-3  btn-lg"
									style="padding-left: 2.5rem; padding-right: 2.5rem;">Sign
									up</button>

								<p class="small fw-bold mt-2 mb-2 pt-1 mb-0">
									Already have an account? 
									<a href="<c:url value='login'/>"
										class="link-danger">Login</a>
								</p>
								<!-- Register buttons -->
								<div class="text-center">
									<p>or sign up with:</p>
									<button type="button" class="btn btn-link btn-floating mx-1">
										<i class="bi bi-facebook"></i>
									</button>

									<button type="button" class="btn btn-link btn-floating mx-1">
										<i class="bi bi-google"></i>
									</button>

									<button type="button" class="btn btn-link btn-floating mx-1">
										<i class="bi bi-twitter"></i>
									</button>

									<button type="button" class="btn btn-link btn-floating mx-1">
										<i class="bi bi-github"></i>
									</button>
								</div>
							</form>
							
						</div>
					</div>
				</div>

				<div class="col-lg-6 mb-5 mb-lg-0">
					<img src="<c:url value='/template/user/img/ve-nha-la-tet.jpg'/>"
						class="w-100 rounded-4 shadow-4" alt="" />
				</div>
			</div>
		</div>
		<!-- Jumbotron -->
	</section>
	<!-- Section: Design Block -->




</body>

</html>