<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Forgot Password</title>


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

a {
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
							<h2 class="fw-bold mb-5">Forgot Password</h2>


							<!-- 2 column grid layout with text inputs for the first and last names -->



							<!-- Email input -->
							<div class="form-outline mb-4">
								<label class="form-label" for="form3Example2">Email
									address </label>
									 <input type="email" name="email" id="email"
									placeholder="Email" class="form-control" />
							</div>

							<!-- Submit button -->

							<button type="button" id="sendBtn"
								class="btn btn-signup mb-3  btn-lg"
								style="padding-left: 2.5rem; padding-right: 2.5rem;">Submit</button>
							<h5 style="color: red;" id="messageReturn"></h5>



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
	
    <script>
        $('#sendBtn').click(function () {
            $('#messageReturn').text('');
            var email = $('#email').val();
            var formData = {
                'email': email,
            };
            $.ajax({
                url: 'forgotPass',
                type: 'POST',
                data: formData,
            })
                .then(function (data) {
                    $('#messageReturn').text(
                        'Password has been reset, please check your email'
                    );
                    setTimeout(function (error) {
                        window.location.href = 'http://localhost:8080/asmjava4/index';
                    }, 5 * 1000);
                })
                .fail(function () {
                    $('#messageReturn').text(
                        'Your information is not correct, try again'
                    );
                });
        });
    </script>
</body>

</html>