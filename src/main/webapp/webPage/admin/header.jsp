<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp" %>
<!-- ========== Topbar Start ========== -->
<header class="topbar">
	<div class="container-fluid">
		<div class="navbar-header">
			<div class="d-flex align-items-center">
				<!-- Menu Toggle Button -->
				<div class="topbar-item">
					<button type="button" class="button-toggle-menu me-2">
						<iconify-icon icon="solar:hamburger-menu-broken"
							class="fs-24 align-middle">
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
					</button>
				</div>

				<!-- Menu Toggle Button -->
				<div class="topbar-item">
					<h4 class="fw-bold topbar-button pe-none text-uppercase mb-0">Welcome!</h4>
				</div>
			</div>

			<div class="d-flex align-items-center gap-1">

				<!-- Theme Color (Light/Dark) -->
				<div class="topbar-item">
					<button type="button" class="topbar-button" id="light-dark-mode">
						<iconify-icon icon="solar:moon-bold-duotone"
							class="fs-24 align-middle">
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
							<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
								viewBox="0 0 24 24">
                                                       <path
									fill="currentColor" fill-rule="evenodd"
									d="M22 12c0 5.523-4.477 10-10 10a10 10 0 0 1-3.321-.564A9 9 0 0 1 8 18a8.97 8.97 0 0 1 2.138-5.824A6.5 6.5 0 0 0 15.5 15a6.5 6.5 0 0 0 5.567-3.143c.24-.396.933-.32.933.143"
									clip-rule="evenodd" opacity=".5"></path>
                                                       <path
									fill="currentColor"
									d="M2 12c0 4.359 2.789 8.066 6.679 9.435A9 9 0 0 1 8 18c0-2.221.805-4.254 2.138-5.824A6.47 6.47 0 0 1 9 8.5a6.5 6.5 0 0 1 3.143-5.567C12.54 2.693 12.463 2 12 2C6.477 2 2 6.477 2 12">
                                                       </path>
                                                  </svg>
						</template>
						</iconify-icon>
					</button>
				</div>

				<!-- Notification -->
				<div class="dropdown topbar-item">
					<button type="button" class="topbar-button position-relative"
						id="page-header-notifications-dropdown" data-bs-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<iconify-icon icon="solar:bell-bing-bold-duotone"
							class="fs-24 align-middle">
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
							<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
								viewBox="0 0 24 24">
                                                       <path
									fill="currentColor"
									d="M18.75 9v.704c0 .845.24 1.671.692 2.374l1.108 1.723c1.011 1.574.239 3.713-1.52 4.21a25.8 25.8 0 0 1-14.06 0c-1.759-.497-2.531-2.636-1.52-4.21l1.108-1.723a4.4 4.4 0 0 0 .693-2.374V9c0-3.866 3.022-7 6.749-7s6.75 3.134 6.75 7"
									opacity=".5"></path>
                                                       <path
									fill="currentColor"
									d="M12.75 6a.75.75 0 0 0-1.5 0v4a.75.75 0 0 0 1.5 0zM7.243 18.545a5.002 5.002 0 0 0 9.513 0c-3.145.59-6.367.59-9.513 0">
                                                       </path>
                                                  </svg>
						</template>
						</iconify-icon>
						<span
							class="position-absolute topbar-badge fs-10 translate-middle badge bg-danger rounded-pill">3<span
							class="visually-hidden">unread messages</span></span>
					</button>
					<div class="dropdown-menu py-0 dropdown-lg dropdown-menu-end"
						aria-labelledby="page-header-notifications-dropdown">
						<div
							class="p-3 border-top-0 border-start-0 border-end-0 border-dashed border">
							<div class="row align-items-center">
								<div class="col">
									<h6 class="m-0 fs-16 fw-semibold">Notifications</h6>
								</div>
								<div class="col-auto">
									<a href="javascript: void(0);"
										class="text-dark text-decoration-underline"> <small>Clear
											All</small>
									</a>
								</div>
							</div>
						</div>
						<div data-simplebar="init" style="max-height: 280px;">
							<div class="simplebar-wrapper" style="margin: 0px;">
								<div class="simplebar-height-auto-observer-wrapper">
									<div class="simplebar-height-auto-observer"></div>
								</div>
								<div class="simplebar-mask">
									<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
										<div class="simplebar-content-wrapper" tabindex="0"
											role="region" aria-label="scrollable content"
											style="height: auto; overflow: hidden;">
											<div class="simplebar-content" style="padding: 0px;">
												<!-- Item -->
												<a href="javascript:void(0);"
													class="dropdown-item py-3 border-bottom text-wrap">
													<div class="d-flex">
														<div class="flex-shrink-0">
															<img
																src="../webPage/admin/assets/images/users/avatar-1.jpg"
																class="img-fluid me-2 avatar-sm rounded-circle"
																alt="avatar-1">
														</div>
														<div class="flex-grow-1">
															<p class="mb-0">
																<span class="fw-medium">Josephine Thompson </span>commented
																on admin panel <span>" Wow ð! this admin looks
																	good and awesome design"</span>
															</p>
														</div>
													</div>
												</a>
												<!-- Item -->
												<a href="javascript:void(0);"
													class="dropdown-item py-3 border-bottom">
													<div class="d-flex">
														<div class="flex-shrink-0">
															<div class="avatar-sm me-2">
																<span
																	class="avatar-title bg-soft-info text-info fs-20 rounded-circle">
																	D </span>
															</div>
														</div>
														<div class="flex-grow-1">
															<p class="mb-0 fw-semibold">Donoghue Susan</p>
															<p class="mb-0 text-wrap">Hi, How are you? What about
																our next meeting</p>
														</div>
													</div>
												</a>
												<!-- Item -->
												<a href="javascript:void(0);"
													class="dropdown-item py-3 border-bottom">
													<div class="d-flex">
														<div class="flex-shrink-0">
															<img
																src="../webPage/admin/assets/images/users/avatar-3.jpg"
																class="img-fluid me-2 avatar-sm rounded-circle"
																alt="avatar-3">
														</div>
														<div class="flex-grow-1">
															<p class="mb-0 fw-semibold">Jacob Gines</p>
															<p class="mb-0 text-wrap">Answered to your comment on
																the cash flow forecast's graph ð.</p>
														</div>
													</div>
												</a>
												<!-- Item -->
												<a href="javascript:void(0);"
													class="dropdown-item py-3 border-bottom">
													<div class="d-flex">
														<div class="flex-shrink-0">
															<div class="avatar-sm me-2">
																<span
																	class="avatar-title bg-soft-warning text-warning fs-20 rounded-circle">
																	<iconify-icon icon="iconamoon:comment-dots-duotone">
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
																</span>
															</div>
														</div>
														<div class="flex-grow-1">
															<p class="mb-0 fw-semibold text-wrap">
																You have received <b>20</b> new messages in the
																conversation
															</p>
														</div>
													</div>
												</a>
												<!-- Item -->
												<a href="javascript:void(0);"
													class="dropdown-item py-3 border-bottom">
													<div class="d-flex">
														<div class="flex-shrink-0">
															<img
																src="../webPage/admin/assets/images/users/avatar-5.jpg"
																class="img-fluid me-2 avatar-sm rounded-circle"
																alt="avatar-5">
														</div>
														<div class="flex-grow-1">
															<p class="mb-0 fw-semibold">Shawn Bunch</p>
															<p class="mb-0 text-wrap">Commented on Admin</p>
														</div>
													</div>
												</a>
											</div>
										</div>
									</div>
								</div>
								<div class="simplebar-placeholder"
									style="width: 0px; height: 0px;"></div>
							</div>
							<div class="simplebar-track simplebar-horizontal"
								style="visibility: hidden;">
								<div class="simplebar-scrollbar"
									style="width: 0px; display: none;"></div>
							</div>
							<div class="simplebar-track simplebar-vertical"
								style="visibility: hidden;">
								<div class="simplebar-scrollbar"
									style="height: 0px; display: none;"></div>
							</div>
						</div>
						<div class="text-center py-3">
							<a href="javascript:void(0);" class="btn btn-primary btn-sm">View
								All Notification <i class="bx bx-right-arrow-alt ms-1"></i>
							</a>
						</div>
					</div>
				</div>

				<!-- Theme Setting -->
				<div class="topbar-item d-none d-md-flex">
					<button type="button" class="topbar-button" id="theme-settings-btn"
						data-bs-toggle="offcanvas"
						data-bs-target="#theme-settings-offcanvas"
						aria-controls="theme-settings-offcanvas">
						<iconify-icon icon="solar:settings-bold-duotone"
							class="fs-24 align-middle">
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
							<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
								viewBox="0 0 24 24">
                                                       <path
									fill="currentColor" fill-rule="evenodd"
									d="M14.279 2.152C13.909 2 13.439 2 12.5 2s-1.408 0-1.779.152a2 2 0 0 0-1.09 1.083c-.094.223-.13.484-.145.863a1.62 1.62 0 0 1-.796 1.353a1.64 1.64 0 0 1-1.579.008c-.338-.178-.583-.276-.825-.308a2.03 2.03 0 0 0-1.49.396c-.318.242-.553.646-1.022 1.453c-.47.807-.704 1.21-.757 1.605c-.07.526.074 1.058.4 1.479c.148.192.357.353.68.555c.477.297.783.803.783 1.361s-.306 1.064-.782 1.36c-.324.203-.533.364-.682.556a2 2 0 0 0-.399 1.479c.053.394.287.798.757 1.605s.704 1.21 1.022 1.453c.424.323.96.465 1.49.396c.242-.032.487-.13.825-.308a1.64 1.64 0 0 1 1.58.008c.486.28.774.795.795 1.353c.015.38.051.64.145.863c.204.49.596.88 1.09 1.083c.37.152.84.152 1.779.152s1.409 0 1.779-.152a2 2 0 0 0 1.09-1.083c.094-.223.13-.483.145-.863c.02-.558.309-1.074.796-1.353a1.64 1.64 0 0 1 1.579-.008c.338.178.583.276.825.308c.53.07 1.066-.073 1.49-.396c.318-.242.553-.646 1.022-1.453c.47-.807.704-1.21.757-1.605a2 2 0 0 0-.4-1.479c-.148-.192-.357-.353-.68-.555c-.477-.297-.783-.803-.783-1.361s.306-1.064.782-1.36c.324-.203.533-.364.682-.556a2 2 0 0 0 .399-1.479c-.053-.394-.287-.798-.757-1.605s-.704-1.21-1.022-1.453a2.03 2.03 0 0 0-1.49-.396c-.242.032-.487.13-.825.308a1.64 1.64 0 0 1-1.58-.008a1.62 1.62 0 0 1-.795-1.353c-.015-.38-.051-.64-.145-.863a2 2 0 0 0-1.09-1.083"
									clip-rule="evenodd" opacity=".5"></path>
                                                       <path
									fill="currentColor"
									d="M15.523 12c0 1.657-1.354 3-3.023 3s-3.023-1.343-3.023-3S10.83 9 12.5 9s3.023 1.343 3.023 3">
                                                       </path>
                                                  </svg>
						</template>
						</iconify-icon>
					</button>
				</div>

				<!-- Activity -->
				<div class="topbar-item d-none d-md-flex">
					<button type="button" class="topbar-button" id="theme-settings-btn"
						data-bs-toggle="offcanvas"
						data-bs-target="#theme-activity-offcanvas"
						aria-controls="theme-settings-offcanvas">
						<iconify-icon icon="solar:clock-circle-bold-duotone"
							class="fs-24 align-middle">
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
							<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
								viewBox="0 0 24 24">
                                                       <path
									fill="currentColor"
									d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2S2 6.477 2 12s4.477 10 10 10"
									opacity=".5"></path>
                                                       <path
									fill="currentColor" fill-rule="evenodd"
									d="M12 7.25a.75.75 0 0 1 .75.75v3.69l2.28 2.28a.75.75 0 1 1-1.06 1.06l-2.5-2.5a.75.75 0 0 1-.22-.53V8a.75.75 0 0 1 .75-.75"
									clip-rule="evenodd"></path>
                                                  </svg>
						</template>
						</iconify-icon>
					</button>
				</div>

				<!-- User -->
				<div class="dropdown topbar-item">
					<a type="button" class="topbar-button"
						id="page-header-user-dropdown" data-bs-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <span
						class="d-flex align-items-center"> <img
							class="rounded-circle" width="32"
							src="${accountImg}"
							alt="avatar-3">
					</span>
					</a>
					<div class="dropdown-menu dropdown-menu-end">
						<!-- item-->
						<h6 class="dropdown-header">Welcome Gaston!</h6>
						<a class="dropdown-item" href="#"> <i
							class="bx bx-user-circle text-muted fs-18 align-middle me-1"></i><span
							class="align-middle">Profile</span>
						</a> <a class="dropdown-item" href="#"> <i
							class="bx bx-message-dots text-muted fs-18 align-middle me-1"></i><span
							class="align-middle">Messages</span>
						</a> <a class="dropdown-item" href="pages-pricing"> <i
							class="bx bx-wallet text-muted fs-18 align-middle me-1"></i><span
							class="align-middle">Pricing</span>
						</a> <a class="dropdown-item" href="pages-faqs"> <i
							class="bx bx-help-circle text-muted fs-18 align-middle me-1"></i><span
							class="align-middle">Help</span>
						</a> <a class="dropdown-item" href="#"> <i
							class="bx bx-lock text-muted fs-18 align-middle me-1"></i><span
							class="align-middle">Lock screen</span>
						</a>

						<div class="dropdown-divider my-1"></div>

						<a class="dropdown-item text-danger" href="logout"> <i
							class="bx bx-log-out fs-18 align-middle me-1"></i><span
							class="align-middle">Logout</span>
						</a>
					</div>
				</div>

				<!-- App Search-->
				<form class="app-search d-none d-md-block ms-2">
					<div class="position-relative">
						<input type="search" class="form-control" placeholder="Search..."
							autocomplete="off" value="">
						<iconify-icon icon="solar:magnifer-linear"
							class="search-widget-icon">
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
							<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
								viewBox="0 0 24 24">
                                                       <g fill="none"
									stroke="currentColor" stroke-width="1.5">
                                                            <circle
									cx="11.5" cy="11.5" r="9.5"></circle>
                                                            <path
									stroke-linecap="round" d="M18.5 18.5L22 22"></path>
                                                       </g>
                                                  </svg>
						</template>
						</iconify-icon>
					</div>
				</form>
			</div>
		</div>
	</div>
</header>
<!-- ========== Topbar Start ========== -->