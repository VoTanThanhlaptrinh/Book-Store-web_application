<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0046)role-list -->
<html lang="en" data-bs-theme="light" data-topbar-color="light"
	data-menu-color="dark" data-menu-size="sm-hover-active">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Title Meta -->

<title>Roles List | Larkon - Responsive Admin Dashboard Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="A fully responsive premium admin dashboard template">
<meta name="author" content="Techzaa">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="shortcut icon"
	href="../webPage/admin/assets/images/favicon.ico">

<!-- Vendor css (Require in all Page) -->
<link href="../webPage/admin/assets/css/vendor.min.css" rel="stylesheet"
	type="text/css" />

<!-- Icons css (Require in all Page) -->
<link href="../webPage/admin/assets/css/icons.min.css" rel="stylesheet"
	type="text/css" />

<!-- App css (Require in all Page) -->
<link href="../webPage/admin/assets/css/app.min.css" rel="stylesheet"
	type="text/css" />

<!-- Theme Config js (Require in all Page) -->
<script src="../webPage/admin/assets/js/config.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css" data-href="lib\style.css">
.star-rating {
	width: 0;
	position: relative;
	display: inline-block;
	background-image:
		url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDguOSIgaGVpZ2h0PSIxMDMuNiIgdmlld0JveD0iMCAwIDEwOC45IDEwMy42Ij48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6I2UzZTZlNjt9PC9zdHlsZT48L2RlZnM+PHRpdGxlPnN0YXJfMDwvdGl0bGU+PGcgaWQ9IkxheWVyXzIiIGRhdGEtbmFtZT0iTGF5ZXIgMiI+PGcgaWQ9IkxheWVyXzEtMiIgZGF0YS1uYW1lPSJMYXllciAxIj48cG9seWdvbiBjbGFzcz0iY2xzLTEiIHBvaW50cz0iMTA4LjkgMzkuNiA3MS4zIDM0LjEgNTQuNCAwIDM3LjYgMzQuMSAwIDM5LjYgMjcuMiA2Ni4xIDIwLjggMTAzLjYgNTQuNCA4NS45IDg4LjEgMTAzLjYgODEuNyA2Ni4xIDEwOC45IDM5LjYiLz48L2c+PC9nPjwvc3ZnPg0K);
	background-position: 0 0;
	background-repeat: repeat-x;
	cursor: pointer;
}

.star-rating .star-value {
	position: absolute;
	height: 100%;
	width: 100%;
	background:
		url('data:image/svg+xml;base64,PHN2Zw0KCXhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwOC45IiBoZWlnaHQ9IjEwMy42IiB2aWV3Qm94PSIwIDAgMTA4LjkgMTAzLjYiPg0KCTxkZWZzPg0KCQk8c3R5bGU+LmNscy0xe2ZpbGw6I2YxYzk0Nzt9PC9zdHlsZT4NCgk8L2RlZnM+DQoJPHRpdGxlPnN0YXIxPC90aXRsZT4NCgk8ZyBpZD0iTGF5ZXJfMiIgZGF0YS1uYW1lPSJMYXllciAyIj4NCgkJPGcgaWQ9IkxheWVyXzEtMiIgZGF0YS1uYW1lPSJMYXllciAxIj4NCgkJCTxwb2x5Z29uIGNsYXNzPSJjbHMtMSIgcG9pbnRzPSI1NC40IDAgNzEuMyAzNC4xIDEwOC45IDM5LjYgODEuNyA2Ni4xIDg4LjEgMTAzLjYgNTQuNCA4NS45IDIwLjggMTAzLjYgMjcuMiA2Ni4xIDAgMzkuNiAzNy42IDM0LjEgNTQuNCAwIi8+DQoJCTwvZz4NCgk8L2c+DQo8L3N2Zz4NCg==');
	background-repeat: repeat-x;
}

.star-rating.disabled {
	cursor: default;
}

.star-rating.is-busy {
	cursor: wait;
}

.star-rating .star-value.rtl {
	-moz-transform: scaleX(-1);
	-o-transform: scaleX(-1);
	-webkit-transform: scaleX(-1);
	transform: scaleX(-1);
	filter: FlipH;
	-ms-filter: "FlipH";
	right: 0;
	left: auto;
}
</style>
</head>

<body>

	<!-- START Wrapper -->
	<div class="wrapper">

		<!-- ========== Topbar Start ========== -->
		<jsp:include page="/webPage/admin/header.jsp"></jsp:include>
		<!-- Activity Timeline -->
		<div>
			<div class="offcanvas offcanvas-end border-0" tabindex="-1"
				id="theme-activity-offcanvas" style="max-width: 450px; width: 100%;">
				<div
					class="d-flex align-items-center bg-primary p-3 offcanvas-header">
					<h5 class="text-white m-0 fw-semibold">Activity Stream</h5>
					<button type="button" class="btn-close btn-close-white ms-auto"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>

				<div class="offcanvas-body p-0">
					<div data-simplebar="init" class="h-100 p-4">
						<div class="simplebar-wrapper" style="margin: -36px;">
							<div class="simplebar-height-auto-observer-wrapper">
								<div class="simplebar-height-auto-observer"></div>
							</div>
							<div class="simplebar-mask">
								<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
									<div class="simplebar-content-wrapper" tabindex="0"
										role="region" aria-label="scrollable content"
										style="height: 100%; overflow: hidden scroll;">
										<div class="simplebar-content" style="padding: 36px;">
											<div class="position-relative ms-2">
												<span
													class="position-absolute start-0  top-0 border border-dashed h-100"></span>
												<div class="position-relative ps-4">
													<div class="mb-4">
														<span
															class="position-absolute start-0 avatar-sm translate-middle-x bg-danger d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon
																icon="iconamoon:folder-check-duotone">
															<template shadowrootmode="open">
																<style data-style="data-style">
:host {
	display: inline-block;
	vertical-align: 0
}

span, svg {
	display: block
}
</style>
															</template>
															</iconify-icon></span>
														<div class="ms-2">
															<h5 class="mb-1 text-dark fw-semibold fs-15 lh-base">
																Report-Fix / Update</h5>
															<p class="d-flex align-items-center">
																Add 3 files to <span
																	class=" d-flex align-items-center text-primary ms-1"><iconify-icon
																		icon="iconamoon:file-light">
																	<template shadowrootmode="open">
																		<style data-style="data-style">
:host {
	display: inline-block;
	vertical-align: 0
}

span, svg {
	display: block
}
</style>
																	</template>
																	</iconify-icon> Tasks</span>
															</p>
															<div class="bg-light bg-opacity-50 rounded-2 p-2">
																<div class="row">
																	<div class="col-lg-6 border-end border-light">
																		<div class="d-flex align-items-center gap-2">
																			<i class="bx bxl-figma fs-20 text-red"></i> <a
																				href="role-list#!" class="text-dark fw-medium">Concept.fig</a>
																		</div>
																	</div>
																	<div class="col-lg-6">
																		<div class="d-flex align-items-center gap-2">
																			<i class="bx bxl-file-doc fs-20 text-success"></i> <a
																				href="role-list#!" class="text-dark fw-medium">larkon.docs</a>
																		</div>
																	</div>
																</div>
															</div>
															<h6 class="mt-2 text-muted">Monday , 4:24 PM</h6>
														</div>
													</div>
												</div>
												<div class="position-relative ps-4">
													<div class="mb-4">
														<span
															class="position-absolute start-0 avatar-sm translate-middle-x bg-success d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon
																icon="iconamoon:check-circle-1-duotone">
															<template shadowrootmode="open">
																<style data-style="data-style">
:host {
	display: inline-block;
	vertical-align: 0
}

span, svg {
	display: block
}
</style>
															</template>
															</iconify-icon></span>
														<div class="ms-2">
															<h5 class="mb-1 text-dark fw-semibold fs-15 lh-base">Project
																Status</h5>
															<p class="d-flex align-items-center mb-0">
																Marked<span
																	class=" d-flex align-items-center text-primary mx-1"><iconify-icon
																		icon="iconamoon:file-light">
																	<template shadowrootmode="open">
																		<style data-style="data-style">
:host {
	display: inline-block;
	vertical-align: 0
}

span, svg {
	display: block
}
</style>
																	</template>
																	</iconify-icon> Design </span> as <span
																	class="badge bg-success-subtle text-success px-2 py-1 ms-1">
																	Completed</span>
															</p>
															<div
																class="d-flex align-items-center gap-3 mt-1 bg-light bg-opacity-50 p-2 rounded-2">
																<a href="role-list#!" class="fw-medium text-dark">UI/UX
																	Figma Design</a>
																<div class="ms-auto">
																	<a href="role-list#!"
																		class="fw-medium text-primary fs-18"
																		data-bs-toggle="tooltip" data-bs-title="Download"
																		data-bs-placement="bottom"><iconify-icon
																			icon="iconamoon:cloud-download-duotone">
																		<template shadowrootmode="open">
																			<style data-style="data-style">
:host {
	display: inline-block;
	vertical-align: 0
}

span, svg {
	display: block
}
</style>
																		</template>
																		</iconify-icon></a>
																</div>
															</div>
															<h6 class="mt-3 text-muted">Monday , 3:00 PM</h6>
														</div>
													</div>
												</div>
												<div class="position-relative ps-4">
													<div class="mb-4">
														<span
															class="position-absolute start-0 avatar-sm translate-middle-x bg-primary d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-16">UI</span>
														<div class="ms-2">
															<h5 class="mb-1 text-dark fw-semibold fs-15">
																Larkon Application UI v2.0.0 <span
																	class="badge bg-primary-subtle text-primary px-2 py-1 ms-1">
																	Latest</span>
															</h5>
															<p>Get access to over 20+ pages including a dashboard
																layout, charts, kanban board, calendar, and pre-order
																E-commerce &amp; Marketing pages.</p>
															<div class="mt-2">
																<a href="role-list#!" class="btn btn-light btn-sm">Download
																	Zip</a>
															</div>
															<h6 class="mt-3 text-muted">Monday , 2:10 PM</h6>
														</div>
													</div>
												</div>
												<div class="position-relative ps-4">
													<div class="mb-4">
														<span
															class="position-absolute start-0 translate-middle-x bg-success bg-gradient d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><img
															src="../webPage/admin/assets/images/users/avatar-7.jpg"
															alt="avatar-5" class="avatar-sm rounded-circle"></span>
														<div class="ms-2">
															<h5 class="mb-0 text-dark fw-semibold fs-15 lh-base">Alex
																Smith Attached Photos</h5>
															<div class="row g-2 mt-2">
																<div class="col-lg-4">
																	<a href="role-list#!"> <img
																		src="../webPage/admin/assets/images/small/img-6.jpg"
																		alt="" class="img-fluid rounded">
																	</a>
																</div>
																<div class="col-lg-4">
																	<a href="role-list#!"> <img
																		src="../webPage/admin/assets/images/small/img-3.jpg"
																		alt="" class="img-fluid rounded">
																	</a>
																</div>
																<div class="col-lg-4">
																	<a href="role-list#!"> <img
																		src="../webPage/admin/assets/images/small/img-4.jpg"
																		alt="" class="img-fluid rounded">
																	</a>
																</div>
															</div>
															<h6 class="mt-3 text-muted">Monday 1:00 PM</h6>
														</div>
													</div>
												</div>
												<div class="position-relative ps-4">
													<div class="mb-4">
														<span
															class="position-absolute start-0 translate-middle-x bg-success bg-gradient d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><img
															src="../webPage/admin/assets/images/users/avatar-6.jpg"
															alt="avatar-5" class="avatar-sm rounded-circle"></span>
														<div class="ms-2">
															<h5 class="mb-0 text-dark fw-semibold fs-15 lh-base">Rebecca
																J. added a new team member</h5>
															<p class="d-flex align-items-center gap-1">
																<iconify-icon icon="iconamoon:check-circle-1-duotone"
																	class="text-success">
																<template shadowrootmode="open">
																	<style data-style="data-style">
:host {
	display: inline-block;
	vertical-align: 0
}

span, svg {
	display: block
}
</style>
																</template>
																</iconify-icon>
																Added a new member to Front Dashboard
															</p>
															<h6 class="mt-3 text-muted">Monday 10:00 AM</h6>
														</div>
													</div>
												</div>
												<div class="position-relative ps-4">
													<div class="mb-4">
														<span
															class="position-absolute start-0 avatar-sm translate-middle-x bg-warning d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon
																icon="iconamoon:certificate-badge-duotone">
															<template shadowrootmode="open">
																<style data-style="data-style">
:host {
	display: inline-block;
	vertical-align: 0
}

span, svg {
	display: block
}
</style>
															</template>
															</iconify-icon></span>
														<div class="ms-2">
															<h5 class="mb-0 text-dark fw-semibold fs-15 lh-base">
																Achievements</h5>
															<p class="d-flex align-items-center gap-1 mt-1">
																Earned a
																<iconify-icon icon="iconamoon:certificate-badge-duotone"
																	class="text-danger fs-20">
																<template shadowrootmode="open">
																	<style data-style="data-style">
:host {
	display: inline-block;
	vertical-align: 0
}

span, svg {
	display: block
}
</style>
																</template>
																</iconify-icon>
																" Best Product Award"
															</p>
															<h6 class="mt-3 text-muted">Monday 9:30 AM</h6>
														</div>
													</div>
												</div>
											</div>
											<a href="role-list#!" class="btn btn-outline-dark w-100">View
												All</a>
										</div>
									</div>
								</div>
							</div>
							<div class="simplebar-placeholder"
								style="width: auto; height: 1101px;"></div>
						</div>
						<div class="simplebar-track simplebar-horizontal"
							style="visibility: hidden;">
							<div class="simplebar-scrollbar"
								style="width: 0px; display: none;"></div>
						</div>
						<div class="simplebar-track simplebar-vertical"
							style="visibility: visible;">
							<div class="simplebar-scrollbar"
								style="height: 361px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Right Sidebar (Theme Settings) -->
		<div>
			<div class="offcanvas offcanvas-end border-0" tabindex="-1"
				id="theme-settings-offcanvas">
				<div
					class="d-flex align-items-center bg-primary p-3 offcanvas-header">
					<h5 class="text-white m-0">Theme Settings</h5>
					<button type="button" class="btn-close btn-close-white ms-auto"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>

				<div class="offcanvas-body p-0">
					<div data-simplebar="init" class="h-100">
						<div class="simplebar-wrapper" style="margin: 0px;">
							<div class="simplebar-height-auto-observer-wrapper">
								<div class="simplebar-height-auto-observer"></div>
							</div>
							<div class="simplebar-mask">
								<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
									<div class="simplebar-content-wrapper" tabindex="0"
										role="region" aria-label="scrollable content"
										style="height: 100%; overflow: hidden scroll;">
										<div class="simplebar-content" style="padding: 0px;">
											<div class="p-3 settings-bar">

												<div>
													<h5 class="mb-3 font-16 fw-semibold">Color Scheme</h5>

													<div class="form-check mb-2">
														<input class="form-check-input" type="radio"
															name="data-bs-theme" id="layout-color-light"
															value="light"> <label class="form-check-label"
															for="layout-color-light">Light</label>
													</div>

													<div class="form-check mb-2">
														<input class="form-check-input" type="radio"
															name="data-bs-theme" id="layout-color-dark" value="dark">
														<label class="form-check-label" for="layout-color-dark">Dark</label>
													</div>
												</div>

												<div>
													<h5 class="my-3 font-16 fw-semibold">Topbar Color</h5>

													<div class="form-check mb-2">
														<input class="form-check-input" type="radio"
															name="data-topbar-color" id="topbar-color-light"
															value="light"> <label class="form-check-label"
															for="topbar-color-light">Light</label>
													</div>
													<div class="form-check mb-2">
														<input class="form-check-input" type="radio"
															name="data-topbar-color" id="topbar-color-dark"
															value="dark"> <label class="form-check-label"
															for="topbar-color-dark">Dark</label>
													</div>
												</div>


												<div>
													<h5 class="my-3 font-16 fw-semibold">Menu Color</h5>

													<div class="form-check mb-2">
														<input class="form-check-input" type="radio"
															name="data-menu-color" id="leftbar-color-light"
															value="light"> <label class="form-check-label"
															for="leftbar-color-light"> Light </label>
													</div>

													<div class="form-check mb-2">
														<input class="form-check-input" type="radio"
															name="data-menu-color" id="leftbar-color-dark"
															value="dark"> <label class="form-check-label"
															for="leftbar-color-dark"> Dark </label>
													</div>
												</div>

												<div>
													<h5 class="my-3 font-16 fw-semibold">Sidebar Size</h5>

													<div class="form-check mb-2">
														<input class="form-check-input" type="radio"
															name="data-menu-size" id="leftbar-size-default"
															value="default"> <label class="form-check-label"
															for="leftbar-size-default"> Default </label>
													</div>

													<div class="form-check mb-2">
														<input class="form-check-input" type="radio"
															name="data-menu-size" id="leftbar-size-small"
															value="condensed"> <label
															class="form-check-label" for="leftbar-size-small">
															Condensed </label>
													</div>

													<div class="form-check mb-2">
														<input class="form-check-input" type="radio"
															name="data-menu-size" id="leftbar-hidden" value="hidden">
														<label class="form-check-label" for="leftbar-hidden">
															Hidden </label>
													</div>

													<div class="form-check mb-2">
														<input class="form-check-input" type="radio"
															name="data-menu-size"
															id="leftbar-size-small-hover-active"
															value="sm-hover-active"> <label
															class="form-check-label"
															for="leftbar-size-small-hover-active"> Small
															Hover Active </label>
													</div>

													<div class="form-check mb-2">
														<input class="form-check-input" type="radio"
															name="data-menu-size" id="leftbar-size-small-hover"
															value="sm-hover"> <label class="form-check-label"
															for="leftbar-size-small-hover"> Small Hover </label>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="simplebar-placeholder"
								style="width: auto; height: 609px;"></div>
						</div>
						<div class="simplebar-track simplebar-horizontal"
							style="visibility: hidden;">
							<div class="simplebar-scrollbar"
								style="width: 0px; display: none;"></div>
						</div>
						<div class="simplebar-track simplebar-vertical"
							style="visibility: visible;">
							<div class="simplebar-scrollbar"
								style="height: 484px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
						</div>
					</div>
				</div>
				<div class="offcanvas-footer border-top p-3 text-center">
					<div class="row">
						<div class="col">
							<button type="button" class="btn btn-danger w-100"
								id="reset-layout">Reset</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ========== Topbar End ========== -->

		<!-- ========== App Menu Start ========== -->
		<jsp:include page="/webPage/admin/main-nav.jsp"></jsp:include>
		<!-- ========== App Menu End ========== -->

		<!-- ==================================================== -->
		<!-- Start right Content here -->
		<!-- ==================================================== -->
		<div class="page-content">

			<!-- Start Container Fluid -->
			<div class="container-xxl">

				<div class="card overflow-hiddenCoupons">
					<div class="card-body p-0">
						<div class="table-responsive">
							<table class="table align-middle mb-0 table-hover table-centered">
								<thead class="bg-light-subtle">
									<tr>
										<th>Role</th>
										<th>User name</th>
										<th>Avatar</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${users}" varStatus="status">
									<tr>
										
										<td><c:forEach var="role" items="${user.roles}">
												<span
													class="badge bg-light-subtle text-muted border py-1 px-2">${role}</span>
											</c:forEach></td>
										<td>${user.username}</td>
										<td>
											<div class="avatar-group">
												<div class="avatar">
													<img
														src="../getImage?img_id=${imgIds[status.index]}"
														alt="" class="rounded-circle avatar-sm">
												</div>
											</div>
										</td>
										<td>
											<div class="form-check form-switch">
												<input class="form-check-input" type="checkbox"
													role="switch" id="flexSwitchCheckChecked1" checked="">
											</div>
										</td>
										<td>
											<div class="d-flex gap-2">
								 <a href="../admin/role-edit?user_id=${user.userId}" class="btn btn-soft-primary btn-sm"><iconify-icon
														icon="solar:pen-2-broken" class="align-middle fs-18">
													<template shadowrootmode="open">
														<style data-style="data-style">
:host {
	display: inline-block;
	vertical-align: 0
}

span, svg {
	display: block
}
</style>
														<svg xmlns="http://www.w3.org/2000/svg" width="1em"
															height="1em" viewBox="0 0 24 24">
                                                                <path
																fill="none" stroke="currentColor" stroke-linecap="round"
																stroke-width="1.5"
																d="M4 22h4m12 0h-8m1.888-18.337l.742-.742a3.146 3.146 0 1 1 4.449 4.45l-.742.74m-4.449-4.448s.093 1.576 1.483 2.966s2.966 1.483 2.966 1.483m-4.449-4.45L7.071 10.48c-.462.462-.693.692-.891.947a5.2 5.2 0 0 0-.599.969c-.139.291-.242.601-.449 1.22l-.875 2.626m14.08-8.13L14.93 11.52m-3.41 3.41c-.462.462-.692.692-.947.891q-.451.352-.969.599c-.291.139-.601.242-1.22.448l-2.626.876m0 0l-.641.213a.848.848 0 0 1-1.073-1.073l.213-.641m1.501 1.5l-1.5-1.5">
                                                                </path>
                                                            </svg>
													</template>
													</iconify-icon></a> <a href="role-list#!" class="btn btn-soft-danger btn-sm"><iconify-icon
														icon="solar:trash-bin-minimalistic-2-broken"
														class="align-middle fs-18">
													<template shadowrootmode="open">
														<style data-style="data-style">
:host {
	display: inline-block;
	vertical-align: 0
}

span, svg {
	display: block
}
</style>
														<svg xmlns="http://www.w3.org/2000/svg" width="1em"
															height="1em" viewBox="0 0 24 24">
                                                                <path
																fill="none" stroke="currentColor" stroke-linecap="round"
																stroke-width="1.5"
																d="M20.5 6h-17m5.67-2a3.001 3.001 0 0 1 5.66 0m3.544 11.4c-.177 2.654-.266 3.981-1.131 4.79s-2.195.81-4.856.81h-.774c-2.66 0-3.99 0-4.856-.81c-.865-.809-.953-2.136-1.13-4.79l-.46-6.9m13.666 0l-.2 3">
                                                                </path>
                                                            </svg>
													</template>
													</iconify-icon></a>
											</div>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- end table-responsive -->
					</div>
					<div
						class="row g-0 align-items-center justify-content-between text-center text-sm-start p-3 border-top">
						<div class="col-sm">
							<!-- <div class="text-muted">
                                Showing <span class="fw-semibold">10</span> of <span class="fw-semibold">59</span>
                                Results
                            </div> -->
						</div>
						<div class="col-sm-auto mt-3 mt-sm-0">
							<ul class="pagination  m-0">
								<!-- Previous -->
								<c:choose>
									<c:when test="${currentPage > 1}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/admin/role-list?pageNum=${currentPage - 1}">Previous</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link"
											href="#">Previous</a></li>
									</c:otherwise>
								</c:choose>

								<!-- Page Numbers (Hiển thị 5 trang gần nhất) -->
								<c:set var="startPage" value="${currentPage - 2}" />
								<c:set var="endPage" value="${currentPage + 2}" />

								<!-- Điều chỉnh startPage và endPage để không vượt quá giới hạn -->
								<c:if test="${startPage < 1}">
									<c:set var="startPage" value="1" />
									<c:set var="endPage" value="${startPage + 4}" />
								</c:if>
								<c:if test="${endPage > totalPages}">
									<c:set var="endPage" value="${totalPages}" />
									<c:set var="startPage"
										value="${endPage - 4 > 0 ? endPage - 4 : 1}" />
								</c:if>
								<c:if test="${endPage - startPage + 1 < 5 && totalPages >= 5}">
									<c:set var="startPage" value="${endPage - 4}" />
									<c:if test="${startPage < 1}">
										<c:set var="startPage" value="1" />
									</c:if>
								</c:if>

								<!-- Hiển thị dấu "..." nếu không phải trang đầu -->
								<c:if test="${startPage > 1}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/admin/role-list?pageNum=1">1</a>
									</li>
									<li class="page-item disabled"><span class="page-link">...</span>
									</li>
								</c:if>

								<!-- Hiển thị các trang trong khoảng startPage đến endPage -->
								<c:forEach begin="${startPage}" end="${endPage}" var="i">
									<c:choose>
										<c:when test="${i == currentPage}">
											<li class="page-item active"><a class="page-link"
												href="#">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/admin/role-list?pageNum=${i}">${i}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<!-- Hiển thị dấu "..." nếu không phải trang cuối -->
								<c:if test="${endPage < totalPages}">
									<li class="page-item disabled"><span class="page-link">...</span>
									</li>
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/admin/role-list?pageNum=${totalPages}">${totalPages}</a>
									</li>
								</c:if>

								<!-- Next -->
								<c:choose>
									<c:when test="${currentPage < totalPages}">
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/admin/role-list?pageNum=${currentPage + 1}">Next</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link"
											href="#">Next</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
				<!-- end card -->

			</div>
			<!-- End Container Fluid -->

			<!-- ========== Footer Start ========== -->
			<jsp:include page="/webPage/admin/footer.jsp"></jsp:include>
			<!-- ========== Footer End ========== -->

		</div>
		<!-- ==================================================== -->
		<!-- End Page Content -->
		<!-- ==================================================== -->

	</div>
	<!-- END Wrapper -->

	<!-- Vendor Javascript (Require in all Page) -->
	<script src="../webPage/admin/assets/js/vendor.js"></script>

	<!-- App Javascript (Require in all Page) -->
	<script src="../webPage/admin/assets/js/app.js"></script>



	<svg id="SvgjsSvg1001" width="2" height="0"
		xmlns="http://www.w3.org/2000/svg" version="1.1"
		xmlns:xlink="http://www.w3.org/1999/xlink"
		xmlns:svgjs="http://svgjs.dev"
		style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;">
        <defs id="SvgjsDefs1002"></defs>
        <polyline id="SvgjsPolyline1003" points="0,0"></polyline>
        <path id="SvgjsPath1004" d="M0 0 "></path>
    </svg>
</body>

</html>