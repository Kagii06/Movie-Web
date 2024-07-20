<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${video.title}</title>
<%@ include file="/common/head.jsp"%>
<!--
    
TemplateMo 556 Catalog-Z

https://templatemo.com/tm-556-catalog-z

-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

	<%@ include file="/common/header.jsp"%>

	<div class="container-fluid tm-container-content tm-mt-60">
		<div class="row mb-4">
			<h2 class="col-12 tm-text-primary">${video.title}</h2>
		</div>
		<div class="row tm-mb-90">
			<div class="col-xl-8 col-lg-7 col-md-6 col-sm-12">
				<iframe id="tm-video"
					src="https://www.youtube.com/embed/${video.href}"
					style="min-height: 500px !important"> </iframe>
			</div>
			<div class="col-xl-4 col-lg-5 col-md-6 col-sm-12">
				<div class="tm-bg-gray tm-video-details">
					<c:if test="${not empty sessionScope.currentUser }">

						<div class="text-center me-2 mb-5">
							<button type="button" id="likeOrUnlikeBtn"
								class="btn btn-danger tm-btn-big">
								<c:choose>
									<c:when test="${flagLikedBtn == true}">
									Unlike
									</c:when>
									<c:otherwise>Like</c:otherwise>
								</c:choose>
							</button>
						</div>

						<div class="text-center mb-5">
							<a href="#" class="btn btn-danger tm-btn-big">Share</a>
						</div>

					</c:if>


					<div class="mb-4">
						<h3 class="tm-text-gray-dark mb-3">Description</h3>
						<p>${video.description}</p>
					</div>
					<input id="videoIdHdn" type="hidden" value="${video.href}">
				</div>
			</div>
		</div>
		<div class="row mb-4">
			<h2 class="col-12 tm-text-primary">Related Videos</h2>
		</div>


		<div class="row mb-3 tm-gallery">
			<c:forEach items="${videos}" var="video">
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
					<h5 class="t,-text-secondary"
						style="white-space: nowap; overflow: hidden;">${video.title}
					</h5>
					<figure class="effect-ming tm-video-item">
						<img src="<c:url value='${video.poster}'></c:url>"
							class="img-fluid">
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2>View more</h2>
							<a href="<c:url value='/video?action=watch&id=${video.href}'/>">View
								more</a>
						</figcaption>
					</figure>
					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light">${video.shares} shares</span> <span>${video.views}
							views</span>
					</div>
					
				</div>
			</c:forEach>
		</div>


		<!-- row -->
	</div>
	<!-- container-fluid, tm-container-content -->


	<%@ include file="/common/footer.jsp"%>


	<script>
		$(document).ready(function() {
			$('#likeOrUnlikeBtn').click(function() {
				var videoId = $('#videoIdHdn').val();
				$.ajax({
					url : 'video?action=like&id=' + videoId
				}).then(function(data) {
					var text = $('#likeOrUnlikeBtn').text();
					if (text.indexOf('Like') != -1) {
						$('#likeOrUnlikeBtn').text('Unlike');
					} else {
						$('#likeOrUnlikeBtn').text('Like');
					}
				}).fail(function(error) {
					alert('Oops!!! Please try again ^^');
				});
			});
		});
	</script>


</body>
</html>