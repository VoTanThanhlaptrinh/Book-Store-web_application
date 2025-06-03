<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<div class="main-nav">
	<!-- Sidebar Logo -->
	<div class="logo-box">
		<a href="../admin/home" class="logo-dark"> <img
			src="../webPage/admin/assets/images/logo-sm.png" class="logo-sm"
			alt="logo sm"> <img
			src="../webPage/admin/assets/images/logo-dark.png" class="logo-lg"
			alt="logo dark">
		</a> <a href="../admin/home" class="logo-light"> <img
			src="../webPage/admin/assets/images/logo-sm.png" class="logo-sm"
			alt="logo sm"> <img
			src="../webPage/admin/assets/images/logo-light.png" class="logo-lg"
			alt="logo light">
		</a>
	</div>

	<!-- Menu Toggle Button (sm-hover) -->
	<button type="button" class="button-sm-hover"
		aria-label="Show Full Sidebar">
		<iconify-icon icon="solar:double-alt-arrow-right-bold-duotone"
			class="button-sm-hover-icon">
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
                                   <path fill="currentColor"
					d="M6.25 19a.75.75 0 0 0 1.32.488l6-7a.75.75 0 0 0 0-.976l-6-7A.75.75 0 0 0 6.25 5z"
					opacity=".5"></path>
                                   <path fill="currentColor"
					fill-rule="evenodd"
					d="M10.512 19.57a.75.75 0 0 1-.081-1.058L16.012 12l-5.581-6.512a.75.75 0 1 1 1.139-.976l6 7a.75.75 0 0 1 0 .976l-6 7a.75.75 0 0 1-1.058.082"
					clip-rule="evenodd"></path>
                              </svg>
		</template>
		</iconify-icon>
	</button>

	<div class="scrollbar" data-simplebar="init">
		<div class="simplebar-wrapper" style="margin: 0px;">
			<div class="simplebar-height-auto-observer-wrapper">
				<div class="simplebar-height-auto-observer"></div>
			</div>
			<div class="simplebar-mask">
				<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
					<div class="simplebar-content-wrapper" tabindex="0" role="region"
						aria-label="scrollable content"
						style="height: 100%; overflow: hidden scroll;">
						<div class="simplebar-content" style="padding: 0px;">
							<ul class="navbar-nav" id="navbar-nav">

								<li class="menu-title">General</li>

								<li class="nav-item active"><a class="nav-link active"
									href="admin/home"> <span class="nav-icon"> <iconify-icon
												icon="solar:widget-5-bold-duotone">
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
														fill="currentColor"
														d="M13 15.4c0-2.074 0-3.111.659-3.756S15.379 11 17.5 11s3.182 0 3.841.644C22 12.29 22 13.326 22 15.4v2.2c0 2.074 0 3.111-.659 3.756S19.621 22 17.5 22s-3.182 0-3.841-.644C13 20.71 13 19.674 13 17.6z"
														opacity=".5"></path>
                                                                                <path
														fill="currentColor"
														d="M2 8.6c0 2.074 0 3.111.659 3.756S4.379 13 6.5 13s3.182 0 3.841-.644C11 11.71 11 10.674 11 8.6V6.4c0-2.074 0-3.111-.659-3.756S8.621 2 6.5 2s-3.182 0-3.841.644C2 3.29 2 4.326 2 6.4zm11-3.1c0-1.087 0-1.63.171-2.06a2.3 2.3 0 0 1 1.218-1.262C14.802 2 15.327 2 16.375 2h2.25c1.048 0 1.573 0 1.986.178c.551.236.99.69 1.218 1.262c.171.43.171.973.171 2.06s0 1.63-.171 2.06a2.3 2.3 0 0 1-1.218 1.262C20.198 9 19.673 9 18.625 9h-2.25c-1.048 0-1.573 0-1.986-.178a2.3 2.3 0 0 1-1.218-1.262C13 7.13 13 6.587 13 5.5">
                                                                                </path>
                                                                                <path
														fill="currentColor"
														d="M2 18.5c0 1.087 0 1.63.171 2.06a2.3 2.3 0 0 0 1.218 1.262c.413.178.938.178 1.986.178h2.25c1.048 0 1.573 0 1.986-.178c.551-.236.99-.69 1.218-1.262c.171-.43.171-.973.171-2.06s0-1.63-.171-2.06a2.3 2.3 0 0 0-1.218-1.262C9.198 15 8.673 15 7.625 15h-2.25c-1.048 0-1.573 0-1.986.178c-.551.236-.99.69-1.218 1.262C2 16.87 2 17.413 2 18.5"
														opacity=".5"></path>
                                                                           </svg>
											</template>
											</iconify-icon>
									</span> <span class="nav-text"> Dashboard </span>
								</a></li>

								<li class="nav-item"><a class="nav-link menu-arrow"
									href="#sidebarProducts" data-bs-toggle="collapse" role="button"
									aria-expanded="false" aria-controls="sidebarProducts"> <span
										class="nav-icon"> <iconify-icon
												icon="solar:t-shirt-bold-duotone">
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
														fill="currentColor" fill-rule="evenodd"
														d="M5.777 18.265v-7.97c0-.683 0-1.025-.132-1.326c-.131-.3-.378-.523-.871-.968l-.186-.167C3.532 6.882 3.004 6.405 3 5.716c-.004-.69.464-1.122 1.401-1.988q.214-.197.418-.362c.472-.378 1.138-.792 1.648-1.09a2.05 2.05 0 0 1 1.567-.205l.49.129c.389.102.727.353.949.703c.6.948 1.564 1.423 2.527 1.423V22c-1.467 0-2.724-.148-3.716-.33c-1.073-.198-1.61-.296-2.058-.858c-.45-.562-.45-1.224-.45-2.547"
														clip-rule="evenodd"></path>
                                                                                <path
														fill="currentColor"
														d="M18.223 18.265v-7.97c0-.683 0-1.025.132-1.326c.131-.3.378-.523.871-.968l.186-.167c1.056-.952 1.584-1.429 1.588-2.118c.004-.69-.465-1.122-1.401-1.988a8 8 0 0 0-.418-.362c-.472-.378-1.138-.792-1.648-1.09a2.05 2.05 0 0 0-1.567-.205l-.49.129a1.6 1.6 0 0 0-.949.703c-.6.948-1.564 1.423-2.527 1.423V22c1.467 0 2.724-.148 3.716-.33c1.073-.198 1.61-.296 2.059-.858c.448-.562.448-1.224.448-2.547"
														opacity=".5"></path>
                                                                           </svg>
											</template>
											</iconify-icon>
									</span> <span class="nav-text"> Products </span>
								</a>
									<div class="collapse" id="sidebarProducts">
										<ul class="nav sub-navbar-nav">
											<li class="sub-nav-item"><a class="sub-nav-link"
												href="product-list">List</a></li>
											<li class="sub-nav-item"><a class="sub-nav-link"
												href="product-add">Create</a></li>
										</ul>
									</div></li>





								<li class="nav-item"><a class="nav-link menu-arrow"
									href="index#sidebarOrders" data-bs-toggle="collapse"
									role="button" aria-expanded="false"
									aria-controls="sidebarOrders"> <span class="nav-icon">
											<iconify-icon icon="solar:bag-smile-bold-duotone">
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
														fill="currentColor"
														d="M4.083 11.894c.439-2.34.658-3.511 1.491-4.203C6.408 7 7.598 7 9.98 7h4.04c2.383 0 3.573 0 4.407.691c.833.692 1.052 1.862 1.491 4.203l.75 4c.617 3.292.926 4.938.026 6.022S18.12 23 14.771 23H9.23c-3.349 0-5.024 0-5.923-1.084c-.9-1.084-.591-2.73.026-6.022z"
														opacity=".5"></path>
                                                                                <path
														fill="currentColor"
														d="M9.75 5.985a2.25 2.25 0 0 1 4.5 0v1c.566 0 1.062.002 1.5.015V5.985a3.75 3.75 0 1 0-7.5 0V7c.438-.013.934-.015 1.5-.015zm.128 9.765a2.251 2.251 0 0 0 4.245 0a.75.75 0 1 1 1.414.5a3.751 3.751 0 0 1-7.073 0a.75.75 0 0 1 1.414-.5">
                                                                                </path>
                                                                           </svg>
											</template>
											</iconify-icon>
									</span> <span class="nav-text"> Orders </span>
								</a>
									<div class="collapse" id="sidebarOrders">
										<ul class="nav sub-navbar-nav">

											<li class="sub-nav-item"><a class="sub-nav-link"
												href="orders-list">List</a></li>
											<li class="sub-nav-item"><a class="sub-nav-link"
												href="order-cart">Cart</a></li>
											<li class="sub-nav-item"><a class="sub-nav-link"
												href="order-checkout">Check Out</a></li>
										</ul>
									</div></li>







								<li class="menu-title mt-2">Users</li>

<!-- 								<li class="nav-item"><a class="nav-link"
									href="pages-profile"> <span class="nav-icon"> <iconify-icon
												icon="solar:chat-square-like-bold-duotone">
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
														fill="currentColor"
														d="m13.629 20.472l-.542.916c-.483.816-1.69.816-2.174 0l-.542-.916c-.42-.71-.63-1.066-.968-1.262c-.338-.197-.763-.204-1.613-.219c-1.256-.021-2.043-.098-2.703-.372a5 5 0 0 1-2.706-2.706C2 14.995 2 13.83 2 11.5v-1c0-3.273 0-4.91.737-6.112a5 5 0 0 1 1.65-1.651C5.59 2 7.228 2 10.5 2h3c3.273 0 4.91 0 6.113.737a5 5 0 0 1 1.65 1.65C22 5.59 22 7.228 22 10.5v1c0 2.33 0 3.495-.38 4.413a5 5 0 0 1-2.707 2.706c-.66.274-1.447.35-2.703.372c-.85.015-1.275.022-1.613.219c-.338.196-.548.551-.968 1.262"
														opacity=".5"></path>
                                                                                <path
														fill="currentColor"
														d="M10.99 14.308c-1.327-.978-3.49-2.84-3.49-4.593c0-2.677 2.475-3.677 4.5-1.609c2.025-2.068 4.5-1.068 4.5 1.609c0 1.752-2.163 3.615-3.49 4.593c-.454.335-.681.502-1.01.502s-.556-.167-1.01-.502">
                                                                                </path>
                                                                           </svg>
											</template>
											</iconify-icon>
									</span> <span class="nav-text"> Profile </span>
								</a></li> -->

								<li class="nav-item"><a class="nav-link menu-arrow"
									href="index#sidebarRoles" data-bs-toggle="collapse"
									role="button" aria-expanded="false"
									aria-controls="sidebarRoles"> <span class="nav-icon">
											<iconify-icon icon="solar:user-speak-rounded-bold-duotone">
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
                                                                                <circle
														cx="10" cy="6.75" r="4" fill="currentColor"></circle>
                                                                                <ellipse
														cx="10" cy="17.75" fill="currentColor" opacity=".5" rx="7"
														ry="4"></ellipse>
                                                                                <path
														fill="currentColor" fill-rule="evenodd"
														d="M18.357 2.364a.75.75 0 0 1 1.029-.257L19 2.75l.386-.643h.001l.002.002l.004.002l.01.006l.113.076c.07.049.166.12.277.212c.222.185.512.462.802.838c.582.758 1.155 1.914 1.155 3.507s-.573 2.75-1.155 3.507c-.29.376-.58.653-.802.838a4 4 0 0 1-.363.27l-.028.018l-.01.006l-.003.002l-.002.001s-.001.001-.387-.642l.386.643a.75.75 0 0 1-.776-1.283l.005-.004l.041-.027q.06-.042.177-.136c.152-.128.362-.326.573-.6c.417-.542.844-1.386.844-2.593s-.427-2.05-.844-2.593a3.8 3.8 0 0 0-.573-.6a3 3 0 0 0-.218-.163l-.005-.003a.75.75 0 0 1-.253-1.027"
														clip-rule="evenodd"></path>
                                                                                <path
														fill="currentColor" fill-rule="evenodd"
														d="M16.33 4.415a.75.75 0 0 1 1.006-.336L17 4.75l.336-.67h.001l.002.001l.004.002l.008.004l.022.012a2 2 0 0 1 .233.153c.136.102.31.254.48.467c.349.436.664 1.099.664 2.031s-.316 1.595-.664 2.031a2.7 2.7 0 0 1-.654.586l-.06.034l-.02.012l-.01.004l-.003.002l-.002.001l-.33-.657l.329.658a.75.75 0 0 1-.685-1.335l.003-.001l.052-.036c.052-.04.13-.106.209-.205c.15-.189.335-.526.335-1.094s-.184-.905-.335-1.094a1.2 1.2 0 0 0-.261-.24l-.003-.002a.75.75 0 0 1-.322-1"
														clip-rule="evenodd"></path>
                                                                           </svg>
											</template>
											</iconify-icon>
									</span> <span class="nav-text"> Roles </span>
								</a>
									<div class="collapse" id="sidebarRoles">
										<ul class="nav sub-navbar-nav">
											<ul class="nav sub-navbar-nav">
												<li class="sub-nav-item"><a class="sub-nav-link"
													href="role-list">List</a></li>
												<li class="sub-nav-item"><a class="sub-nav-link"
													href="role-add">Create</a></li>
											</ul>
										</ul>
									</div></li>



								<li class="nav-item"><a class="nav-link menu-arrow"
									href="index#sidebarCustomers" data-bs-toggle="collapse"
									role="button" aria-expanded="false"
									aria-controls="sidebarCustomers"> <span class="nav-icon">
											<iconify-icon
												icon="solar:users-group-two-rounded-bold-duotone">
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
									</span> <span class="nav-text"> Customers </span>
								</a>
									<div class="collapse" id="sidebarCustomers">
										<ul class="nav sub-navbar-nav">

											<li class="sub-nav-item"><a class="sub-nav-link"
												href="customer-list">List</a></li>
										</ul>
									</div></li>



								<li class="menu-title mt-2">Other</li>

								<li class="nav-item"><a class="nav-link menu-arrow"
									href="index#sidebarCoupons" data-bs-toggle="collapse"
									role="button" aria-expanded="false"
									aria-controls="sidebarCoupons"> <span class="nav-icon">
											<iconify-icon icon="solar:leaf-bold-duotone">
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
									</span> <span class="nav-text"> Coupons </span>
								</a>
									<div class="collapse" id="sidebarCoupons">
										<ul class="nav sub-navbar-nav">
											<li class="sub-nav-item"><a class="sub-nav-link"
												href="coupons-list">List</a></li>
											<li class="sub-nav-item"><a class="sub-nav-link"
												href="coupons-add">Add</a></li>
										</ul>
									</div></li>

								<li class="nav-item"><a class="nav-link"
									href="pages-review"> <span class="nav-icon"> <iconify-icon
												icon="solar:chat-square-like-bold-duotone">
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
									</span> <span class="nav-text"> Reviews </span>
								</a></li>

								<li class="menu-title mt-2">Other Apps</li>








								<li class="menu-title mt-2">Custom</li>







								<li class="menu-title mt-2">Components</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="simplebar-placeholder"
				style="width: auto; height: 1738px;"></div>
		</div>
		<div class="simplebar-track simplebar-horizontal"
			style="visibility: hidden;">
			<div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
		</div>
		<div class="simplebar-track simplebar-vertical"
			style="visibility: visible;">
			<div class="simplebar-scrollbar"
				style="height: 187px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
		</div>
	</div>
</div>
