<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link href="style.css" rel="stylesheet">
<title>Document</title>
</head>

<body>
	<main
		class="d-flex d-inline-block container align-items-center justify-content-center">
		<section class="container-sm mt-3 card shadow-0 border ">
			<h3></h3>
			<div class="row ">
				<div class="col-5">
					<img src="img/book1.png" alt="Book" class="img-fluid">
				</div>
				<div class="col-7">
					<h3>Title</h3>
					<p>Details: Lorem ipsum dolor sit amet consectetur adipisicing
						elit. Perferendis tempore laboriosam atque sit porro. Sed
						similique, quos praesentium necessitatibus veniam velit! Ratione
						inventore sapiente commodi aliquam possimus eum voluptatem illo
						ipsa earum mollitia. Vitae sed illo harum, dolore quibusdam
						necessitatibus sit voluptate optio. Iste nostrum, veritatis velit
						a cupiditate consequatur!</p>
					<p>Details: Lorem ipsum dolor sit amet consectetur adipisicing
						elit. Perferendis tempore laboriosam atque sit porro. Sed
						similique, quos praesentium necessitatibus veniam velit! Ratione
						inventore sapiente commodi aliquam possimus eum voluptatem illo
						ipsa earum mollitia. Vitae sed illo harum, dolore quibusdam
						necessitatibus sit voluptate optio. Iste nostrum, veritatis velit
						a cupiditate consequatur!</p>
					<div class="input-group">
						<label>Amount: </label> <input type="number" placeholder="Amount"
							value="1" class="form-control mx-auto mb-3">
					</div>

					<div class="button-group">
						<form>
							<button class="btn btn-primary w-100" type="submit">
								Cart<span class="material-symbols-outlined">shopping_cart</span>
							</button>
						</form>
						<form>
							<button class="btn btn-primary w-100" type="submit">
								Thanh toÃ¡n<span class="material-symbols-outlined">attach_money</span>
							</button>
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>
	<div class="container pt-5 ">
		<div class="row d-flex justify-content-center">
			<div class="col-md-8 col-lg-10">
				<div class="card shadow-0 border">
					<h3>ÄÃ¡nh GiÃ¡ Sáº£n Pháº©m</h3>
					<div class="card-body p-4">
						<div data-mdb-input-init class="form-outline mb-4 input-group">
							<input type="text" id="addANote" class="form-control"
								placeholder="Type comment..." />
							<button class="btn btn-primary">Publish</button>
						</div>
						<div class="navbar-nav-scroll">
							<div class="card mb-4 ">
								<div class="card-body">
									<p>Type your note, and hit enter to add it</p>

									<div class="d-flex justify-content-between">
										<div class="d-flex flex-row align-items-center">
											<img
												src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(32).webp"
												alt="avatar" width="25" height="25" />
											<p class="small mb-0 ms-2">Johny</p>
										</div>
										<div class="d-flex flex-row align-items-center">
											<a class="small text-muted mb-0">Like</a> <i
												class="far fa-thumbs-up mx-2 fa-xs text-body"
												style="margin-top: -0.16rem;"></i>
											<p class="small text-muted mb-0">4</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>