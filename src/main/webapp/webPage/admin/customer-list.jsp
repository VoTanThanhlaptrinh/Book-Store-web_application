<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0050)customer-list -->
<html lang="en" data-bs-theme="light" data-topbar-color="light" data-menu-color="dark" data-menu-size="sm-hover-active">

<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <!-- Title Meta -->

     <title>Customer List | Larkon - Responsive Admin Dashboard Template</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta name="description" content="A fully responsive premium admin dashboard template">
     <meta name="author" content="Techzaa">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">

     <!-- App favicon -->
     <link rel="shortcut icon" href="../webPage/admin/assets/images/favicon.ico">

     <!-- Vendor css (Require in all Page) -->
     <link href="../webPage/admin/assets/css/vendor.min.css" rel="stylesheet" type="text/css" />

     <!-- Icons css (Require in all Page) -->
     <link href="../webPage/admin/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

     <!-- App css (Require in all Page) -->
     <link href="../webPage/admin/assets/css/app.min.css" rel="stylesheet" type="text/css" />

     <!-- Theme Config js (Require in all Page) -->
     <script src="../webPage/admin/assets/js/config.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
     
     <style type="text/css" data-href="lib\style.css">
          .star-rating {
               width: 0;
               position: relative;
               display: inline-block;
               background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDguOSIgaGVpZ2h0PSIxMDMuNiIgdmlld0JveD0iMCAwIDEwOC45IDEwMy42Ij48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6I2UzZTZlNjt9PC9zdHlsZT48L2RlZnM+PHRpdGxlPnN0YXJfMDwvdGl0bGU+PGcgaWQ9IkxheWVyXzIiIGRhdGEtbmFtZT0iTGF5ZXIgMiI+PGcgaWQ9IkxheWVyXzEtMiIgZGF0YS1uYW1lPSJMYXllciAxIj48cG9seWdvbiBjbGFzcz0iY2xzLTEiIHBvaW50cz0iMTA4LjkgMzkuNiA3MS4zIDM0LjEgNTQuNCAwIDM3LjYgMzQuMSAwIDM5LjYgMjcuMiA2Ni4xIDIwLjggMTAzLjYgNTQuNCA4NS45IDg4LjEgMTAzLjYgODEuNyA2Ni4xIDEwOC45IDM5LjYiLz48L2c+PC9nPjwvc3ZnPg0K);
               background-position: 0 0;
               background-repeat: repeat-x;
               cursor: pointer;
          }

          .star-rating .star-value {
               position: absolute;
               height: 100%;
               width: 100%;
               background: url('data:image/svg+xml;base64,PHN2Zw0KCXhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwOC45IiBoZWlnaHQ9IjEwMy42IiB2aWV3Qm94PSIwIDAgMTA4LjkgMTAzLjYiPg0KCTxkZWZzPg0KCQk8c3R5bGU+LmNscy0xe2ZpbGw6I2YxYzk0Nzt9PC9zdHlsZT4NCgk8L2RlZnM+DQoJPHRpdGxlPnN0YXIxPC90aXRsZT4NCgk8ZyBpZD0iTGF5ZXJfMiIgZGF0YS1uYW1lPSJMYXllciAyIj4NCgkJPGcgaWQ9IkxheWVyXzEtMiIgZGF0YS1uYW1lPSJMYXllciAxIj4NCgkJCTxwb2x5Z29uIGNsYXNzPSJjbHMtMSIgcG9pbnRzPSI1NC40IDAgNzEuMyAzNC4xIDEwOC45IDM5LjYgODEuNyA2Ni4xIDg4LjEgMTAzLjYgNTQuNCA4NS45IDIwLjggMTAzLjYgMjcuMiA2Ni4xIDAgMzkuNiAzNy42IDM0LjEgNTQuNCAwIi8+DQoJCTwvZz4NCgk8L2c+DQo8L3N2Zz4NCg==');
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
          <header class="topbar">
               <div class="container-fluid">
                    <div class="navbar-header">
                         <div class="d-flex align-items-center">
                              <!-- Menu Toggle Button -->
                              <div class="topbar-item">
                                   <button type="button" class="button-toggle-menu me-2">
                                        <iconify-icon icon="solar:hamburger-menu-broken"
                                             class="fs-24 align-middle"><template shadowrootmode="open">
                                                  <style data-style="data-style">
                                                       :host {
                                                            display: inline-block;
                                                            vertical-align: 0
                                                       }

                                                       span,
                                                       svg {
                                                            display: block
                                                       }
                                                  </style>
                                             </template></iconify-icon>
                                   </button>
                              </div>

                              <!-- Menu Toggle Button -->
                              <div class="topbar-item">
                                   <h4 class="fw-bold topbar-button pe-none text-uppercase mb-0">Customer list</h4>
                              </div>
                         </div>

                         <div class="d-flex align-items-center gap-1">

                              <!-- Theme Color (Light/Dark) -->
                              <div class="topbar-item">
                                   <button type="button" class="topbar-button" id="light-dark-mode">
                                        <iconify-icon icon="solar:moon-bold-duotone"
                                             class="fs-24 align-middle"><template shadowrootmode="open">
                                                  <style data-style="data-style">
                                                       :host {
                                                            display: inline-block;
                                                            vertical-align: 0
                                                       }

                                                       span,
                                                       svg {
                                                            display: block
                                                       }
                                                  </style><svg xmlns="http://www.w3.org/2000/svg" width="1em"
                                                       height="1em" viewBox="0 0 24 24">
                                                       <path fill="currentColor" fill-rule="evenodd"
                                                            d="M22 12c0 5.523-4.477 10-10 10a10 10 0 0 1-3.321-.564A9 9 0 0 1 8 18a8.97 8.97 0 0 1 2.138-5.824A6.5 6.5 0 0 0 15.5 15a6.5 6.5 0 0 0 5.567-3.143c.24-.396.933-.32.933.143"
                                                            clip-rule="evenodd" opacity=".5"></path>
                                                       <path fill="currentColor"
                                                            d="M2 12c0 4.359 2.789 8.066 6.679 9.435A9 9 0 0 1 8 18c0-2.221.805-4.254 2.138-5.824A6.47 6.47 0 0 1 9 8.5a6.5 6.5 0 0 1 3.143-5.567C12.54 2.693 12.463 2 12 2C6.477 2 2 6.477 2 12">
                                                       </path>
                                                  </svg>
                                             </template></iconify-icon>
                                   </button>
                              </div>

                              <!-- Notification -->
                              <div class="dropdown topbar-item">
                                   <button type="button" class="topbar-button position-relative"
                                        id="page-header-notifications-dropdown" data-bs-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        <iconify-icon icon="solar:bell-bing-bold-duotone"
                                             class="fs-24 align-middle"><template shadowrootmode="open">
                                                  <style data-style="data-style">
                                                       :host {
                                                            display: inline-block;
                                                            vertical-align: 0
                                                       }

                                                       span,
                                                       svg {
                                                            display: block
                                                       }
                                                  </style><svg xmlns="http://www.w3.org/2000/svg" width="1em"
                                                       height="1em" viewBox="0 0 24 24">
                                                       <path fill="currentColor"
                                                            d="M18.75 9v.704c0 .845.24 1.671.692 2.374l1.108 1.723c1.011 1.574.239 3.713-1.52 4.21a25.8 25.8 0 0 1-14.06 0c-1.759-.497-2.531-2.636-1.52-4.21l1.108-1.723a4.4 4.4 0 0 0 .693-2.374V9c0-3.866 3.022-7 6.749-7s6.75 3.134 6.75 7"
                                                            opacity=".5"></path>
                                                       <path fill="currentColor"
                                                            d="M12.75 6a.75.75 0 0 0-1.5 0v4a.75.75 0 0 0 1.5 0zM7.243 18.545a5.002 5.002 0 0 0 9.513 0c-3.145.59-6.367.59-9.513 0">
                                                       </path>
                                                  </svg>
                                             </template></iconify-icon>
                                        <span
                                             class="position-absolute topbar-badge fs-10 translate-middle badge bg-danger rounded-pill">3<span
                                                  class="visually-hidden">unread messages</span></span>
                                   </button>
                                   <div class="dropdown-menu py-0 dropdown-lg dropdown-menu-end"
                                        aria-labelledby="page-header-notifications-dropdown">
                                        <div class="p-3 border-top-0 border-start-0 border-end-0 border-dashed border">
                                             <div class="row align-items-center">
                                                  <div class="col">
                                                       <h6 class="m-0 fs-16 fw-semibold"> Notifications</h6>
                                                  </div>
                                                  <div class="col-auto">
                                                       <a href="javascript: void(0);"
                                                            class="text-dark text-decoration-underline">
                                                            <small>Clear All</small>
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
                                                                                     <img src="../webPage/admin/assets/images/users/avatar-1.jpg"
                                                                                          class="img-fluid me-2 avatar-sm rounded-circle"
                                                                                          alt="avatar-1">
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                     <p class="mb-0"><span
                                                                                               class="fw-medium">Josephine
                                                                                               Thompson </span>commented
                                                                                          on admin panel
                                                                                          <span>" Wow ð! this admin
                                                                                               looks good and
                                                                                               awesome design"</span>
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
                                                                                               D
                                                                                          </span>
                                                                                     </div>
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                     <p class="mb-0 fw-semibold">
                                                                                          Donoghue Susan</p>
                                                                                     <p class="mb-0 text-wrap">
                                                                                          Hi, How are you? What about
                                                                                          our next meeting
                                                                                     </p>
                                                                                </div>
                                                                           </div>
                                                                      </a>
                                                                      <!-- Item -->
                                                                      <a href="javascript:void(0);"
                                                                           class="dropdown-item py-3 border-bottom">
                                                                           <div class="d-flex">
                                                                                <div class="flex-shrink-0">
                                                                                     <img src="../webPage/admin/assets/images/users/avatar-3.jpg"
                                                                                          class="img-fluid me-2 avatar-sm rounded-circle"
                                                                                          alt="avatar-3">
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                     <p class="mb-0 fw-semibold">Jacob
                                                                                          Gines</p>
                                                                                     <p class="mb-0 text-wrap">Answered
                                                                                          to your comment
                                                                                          on the cash flow forecast's
                                                                                          graph ð.</p>
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
                                                                                               <iconify-icon
                                                                                                    icon="iconamoon:comment-dots-duotone"><template
                                                                                                         shadowrootmode="open">
                                                                                                         <style
                                                                                                              data-style="data-style">
                                                                                                              :host {
                                                                                                                   display: inline-block;
                                                                                                                   vertical-align: 0
                                                                                                              }

                                                                                                              span,
                                                                                                              svg {
                                                                                                                   display: block
                                                                                                              }
                                                                                                         </style>
                                                                                                    </template></iconify-icon>
                                                                                          </span>
                                                                                     </div>
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                     <p
                                                                                          class="mb-0 fw-semibold text-wrap">
                                                                                          You have
                                                                                          received <b>20</b> new
                                                                                          messages in the
                                                                                          conversation</p>
                                                                                </div>
                                                                           </div>
                                                                      </a>
                                                                      <!-- Item -->
                                                                      <a href="javascript:void(0);"
                                                                           class="dropdown-item py-3 border-bottom">
                                                                           <div class="d-flex">
                                                                                <div class="flex-shrink-0">
                                                                                     <img src="../webPage/admin/assets/images/users/avatar-5.jpg"
                                                                                          class="img-fluid me-2 avatar-sm rounded-circle"
                                                                                          alt="avatar-5">
                                                                                </div>
                                                                                <div class="flex-grow-1">
                                                                                     <p class="mb-0 fw-semibold">Shawn
                                                                                          Bunch</p>
                                                                                     <p class="mb-0 text-wrap">
                                                                                          Commented on Admin
                                                                                     </p>
                                                                                </div>
                                                                           </div>
                                                                      </a>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>
                                                  <div class="simplebar-placeholder" style="width: 0px; height: 0px;">
                                                  </div>
                                             </div>
                                             <div class="simplebar-track simplebar-horizontal"
                                                  style="visibility: hidden;">
                                                  <div class="simplebar-scrollbar" style="width: 0px; display: none;">
                                                  </div>
                                             </div>
                                             <div class="simplebar-track simplebar-vertical"
                                                  style="visibility: hidden;">
                                                  <div class="simplebar-scrollbar" style="height: 0px; display: none;">
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="text-center py-3">
                                             <a href="javascript:void(0);" class="btn btn-primary btn-sm">View All
                                                  Notification
                                                  <i class="bx bx-right-arrow-alt ms-1"></i></a>
                                        </div>
                                   </div>
                              </div>

                              <!-- Theme Setting -->
                              <div class="topbar-item d-none d-md-flex">
                                   <button type="button" class="topbar-button" id="theme-settings-btn"
                                        data-bs-toggle="offcanvas" data-bs-target="#theme-settings-offcanvas"
                                        aria-controls="theme-settings-offcanvas">
                                        <iconify-icon icon="solar:settings-bold-duotone"
                                             class="fs-24 align-middle"><template shadowrootmode="open">
                                                  <style data-style="data-style">
                                                       :host {
                                                            display: inline-block;
                                                            vertical-align: 0
                                                       }

                                                       span,
                                                       svg {
                                                            display: block
                                                       }
                                                  </style><svg xmlns="http://www.w3.org/2000/svg" width="1em"
                                                       height="1em" viewBox="0 0 24 24">
                                                       <path fill="currentColor" fill-rule="evenodd"
                                                            d="M14.279 2.152C13.909 2 13.439 2 12.5 2s-1.408 0-1.779.152a2 2 0 0 0-1.09 1.083c-.094.223-.13.484-.145.863a1.62 1.62 0 0 1-.796 1.353a1.64 1.64 0 0 1-1.579.008c-.338-.178-.583-.276-.825-.308a2.03 2.03 0 0 0-1.49.396c-.318.242-.553.646-1.022 1.453c-.47.807-.704 1.21-.757 1.605c-.07.526.074 1.058.4 1.479c.148.192.357.353.68.555c.477.297.783.803.783 1.361s-.306 1.064-.782 1.36c-.324.203-.533.364-.682.556a2 2 0 0 0-.399 1.479c.053.394.287.798.757 1.605s.704 1.21 1.022 1.453c.424.323.96.465 1.49.396c.242-.032.487-.13.825-.308a1.64 1.64 0 0 1 1.58.008c.486.28.774.795.795 1.353c.015.38.051.64.145.863c.204.49.596.88 1.09 1.083c.37.152.84.152 1.779.152s1.409 0 1.779-.152a2 2 0 0 0 1.09-1.083c.094-.223.13-.483.145-.863c.02-.558.309-1.074.796-1.353a1.64 1.64 0 0 1 1.579-.008c.338.178.583.276.825.308c.53.07 1.066-.073 1.49-.396c.318-.242.553-.646 1.022-1.453c.47-.807.704-1.21.757-1.605a2 2 0 0 0-.4-1.479c-.148-.192-.357-.353-.68-.555c-.477-.297-.783-.803-.783-1.361s.306-1.064.782-1.36c.324-.203.533-.364.682-.556a2 2 0 0 0 .399-1.479c-.053-.394-.287-.798-.757-1.605s-.704-1.21-1.022-1.453a2.03 2.03 0 0 0-1.49-.396c-.242.032-.487.13-.825.308a1.64 1.64 0 0 1-1.58-.008a1.62 1.62 0 0 1-.795-1.353c-.015-.38-.051-.64-.145-.863a2 2 0 0 0-1.09-1.083"
                                                            clip-rule="evenodd" opacity=".5"></path>
                                                       <path fill="currentColor"
                                                            d="M15.523 12c0 1.657-1.354 3-3.023 3s-3.023-1.343-3.023-3S10.83 9 12.5 9s3.023 1.343 3.023 3">
                                                       </path>
                                                  </svg>
                                             </template></iconify-icon>
                                   </button>
                              </div>

                              <!-- Activity -->
                              <div class="topbar-item d-none d-md-flex">
                                   <button type="button" class="topbar-button" id="theme-settings-btn"
                                        data-bs-toggle="offcanvas" data-bs-target="#theme-activity-offcanvas"
                                        aria-controls="theme-settings-offcanvas">
                                        <iconify-icon icon="solar:clock-circle-bold-duotone"
                                             class="fs-24 align-middle"><template shadowrootmode="open">
                                                  <style data-style="data-style">
                                                       :host {
                                                            display: inline-block;
                                                            vertical-align: 0
                                                       }

                                                       span,
                                                       svg {
                                                            display: block
                                                       }
                                                  </style><svg xmlns="http://www.w3.org/2000/svg" width="1em"
                                                       height="1em" viewBox="0 0 24 24">
                                                       <path fill="currentColor"
                                                            d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2S2 6.477 2 12s4.477 10 10 10"
                                                            opacity=".5"></path>
                                                       <path fill="currentColor" fill-rule="evenodd"
                                                            d="M12 7.25a.75.75 0 0 1 .75.75v3.69l2.28 2.28a.75.75 0 1 1-1.06 1.06l-2.5-2.5a.75.75 0 0 1-.22-.53V8a.75.75 0 0 1 .75-.75"
                                                            clip-rule="evenodd"></path>
                                                  </svg>
                                             </template></iconify-icon>
                                   </button>
                              </div>

                              <!-- User -->
                              <div class="dropdown topbar-item">
                                   <a type="button" class="topbar-button" id="page-header-user-dropdown"
                                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="d-flex align-items-center">
                                             <img class="rounded-circle" width="32"
                                                  src="../webPage/admin/assets/images/users/avatar-1.jpg" alt="avatar-3">
                                        </span>
                                   </a>
                                   <div class="dropdown-menu dropdown-menu-end">
                                        <!-- item-->
                                        <h6 class="dropdown-header">Welcome Gaston!</h6>
                                        <a class="dropdown-item" href="pages-profile">
                                             <i class="bx bx-user-circle text-muted fs-18 align-middle me-1"></i><span
                                                  class="align-middle">Profile</span>
                                        </a>
                                        <a class="dropdown-item" href="apps-chat">
                                             <i class="bx bx-message-dots text-muted fs-18 align-middle me-1"></i><span
                                                  class="align-middle">Messages</span>
                                        </a>

                                        <a class="dropdown-item" href="pages-pricing">
                                             <i class="bx bx-wallet text-muted fs-18 align-middle me-1"></i><span
                                                  class="align-middle">Pricing</span>
                                        </a>
                                        <a class="dropdown-item" href="pages-faqs">
                                             <i class="bx bx-help-circle text-muted fs-18 align-middle me-1"></i><span
                                                  class="align-middle">Help</span>
                                        </a>
                                        <a class="dropdown-item" href="auth-lock-screen">
                                             <i class="bx bx-lock text-muted fs-18 align-middle me-1"></i><span
                                                  class="align-middle">Lock screen</span>
                                        </a>

                                        <div class="dropdown-divider my-1"></div>

                                        <a class="dropdown-item text-danger" href="auth-signin">
                                             <i class="bx bx-log-out fs-18 align-middle me-1"></i><span
                                                  class="align-middle">Logout</span>
                                        </a>
                                   </div>
                              </div>

                              <!-- App Search-->
                              <form class="app-search d-none d-md-block ms-2">
                                   <div class="position-relative">
                                        <input type="search" class="form-control" placeholder="Search..."
                                             autocomplete="off" value="">
                                        <iconify-icon icon="solar:magnifer-linear" class="search-widget-icon"><template
                                                  shadowrootmode="open">
                                                  <style data-style="data-style">
                                                       :host {
                                                            display: inline-block;
                                                            vertical-align: 0
                                                       }

                                                       span,
                                                       svg {
                                                            display: block
                                                       }
                                                  </style><svg xmlns="http://www.w3.org/2000/svg" width="1em"
                                                       height="1em" viewBox="0 0 24 24">
                                                       <g fill="none" stroke="currentColor" stroke-width="1.5">
                                                            <circle cx="11.5" cy="11.5" r="9.5"></circle>
                                                            <path stroke-linecap="round" d="M18.5 18.5L22 22"></path>
                                                       </g>
                                                  </svg>
                                             </template></iconify-icon>
                                   </div>
                              </form>
                         </div>
                    </div>
               </div>
          </header>

          <!-- Activity Timeline -->
          <div>
               <div class="offcanvas offcanvas-end border-0" tabindex="-1" id="theme-activity-offcanvas"
                    style="max-width: 450px; width: 100%;">
                    <div class="d-flex align-items-center bg-primary p-3 offcanvas-header">
                         <h5 class="text-white m-0 fw-semibold">Activity Stream</h5>
                         <button type="button" class="btn-close btn-close-white ms-auto" data-bs-dismiss="offcanvas"
                              aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body p-0">
                         <div data-simplebar="init" class="h-100 p-4">
                              <div class="simplebar-wrapper" style="margin: -36px;">
                                   <div class="simplebar-height-auto-observer-wrapper">
                                        <div class="simplebar-height-auto-observer"></div>
                                   </div>
                                   <div class="simplebar-mask">
                                        <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                                             <div class="simplebar-content-wrapper" tabindex="0" role="region"
                                                  aria-label="scrollable content"
                                                  style="height: 100%; overflow: hidden scroll;">
                                                  <div class="simplebar-content" style="padding: 36px;">
                                                       <div class="position-relative ms-2">
                                                            <span
                                                                 class="position-absolute start-0  top-0 border border-dashed h-100"></span>
                                                            <div class="position-relative ps-4">
                                                                 <div class="mb-4">
                                                                      <span
                                                                           class="position-absolute start-0 avatar-sm translate-middle-x bg-danger d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon
                                                                                icon="iconamoon:folder-check-duotone"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-1 text-dark fw-semibold fs-15 lh-base">
                                                                                Report-Fix / Update </h5>
                                                                           <p class="d-flex align-items-center">Add 3
                                                                                files to <span
                                                                                     class=" d-flex align-items-center text-primary ms-1"><iconify-icon
                                                                                          icon="iconamoon:file-light"><template
                                                                                               shadowrootmode="open">
                                                                                               <style
                                                                                                    data-style="data-style">
                                                                                                    :host {
                                                                                                         display: inline-block;
                                                                                                         vertical-align: 0
                                                                                                    }

                                                                                                    span,
                                                                                                    svg {
                                                                                                         display: block
                                                                                                    }
                                                                                               </style>
                                                                                          </template></iconify-icon>
                                                                                     Tasks</span></p>
                                                                           <div
                                                                                class="bg-light bg-opacity-50 rounded-2 p-2">
                                                                                <div class="row">
                                                                                     <div
                                                                                          class="col-lg-6 border-end border-light">
                                                                                          <div
                                                                                               class="d-flex align-items-center gap-2">
                                                                                               <i
                                                                                                    class="bx bxl-figma fs-20 text-red"></i>
                                                                                               <a href="customer-list#!"
                                                                                                    class="text-dark fw-medium">Concept.fig</a>
                                                                                          </div>
                                                                                     </div>
                                                                                     <div class="col-lg-6">
                                                                                          <div
                                                                                               class="d-flex align-items-center gap-2">
                                                                                               <i
                                                                                                    class="bx bxl-file-doc fs-20 text-success"></i>
                                                                                               <a href="customer-list#!"
                                                                                                    class="text-dark fw-medium">larkon.docs</a>
                                                                                          </div>
                                                                                     </div>
                                                                                </div>
                                                                           </div>
                                                                           <h6 class="mt-2 text-muted">Monday , 4:24 PM
                                                                           </h6>
                                                                      </div>
                                                                 </div>
                                                            </div>
                                                            <div class="position-relative ps-4">
                                                                 <div class="mb-4">
                                                                      <span
                                                                           class="position-absolute start-0 avatar-sm translate-middle-x bg-success d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon
                                                                                icon="iconamoon:check-circle-1-duotone"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-1 text-dark fw-semibold fs-15 lh-base">
                                                                                Project Status
                                                                           </h5>
                                                                           <p class="d-flex align-items-center mb-0">
                                                                                Marked<span
                                                                                     class=" d-flex align-items-center text-primary mx-1"><iconify-icon
                                                                                          icon="iconamoon:file-light"><template
                                                                                               shadowrootmode="open">
                                                                                               <style
                                                                                                    data-style="data-style">
                                                                                                    :host {
                                                                                                         display: inline-block;
                                                                                                         vertical-align: 0
                                                                                                    }

                                                                                                    span,
                                                                                                    svg {
                                                                                                         display: block
                                                                                                    }
                                                                                               </style>
                                                                                          </template></iconify-icon>
                                                                                     Design </span> as <span
                                                                                     class="badge bg-success-subtle text-success px-2 py-1 ms-1">
                                                                                     Completed</span></p>
                                                                           <div
                                                                                class="d-flex align-items-center gap-3 mt-1 bg-light bg-opacity-50 p-2 rounded-2">
                                                                                <a href="customer-list#!"
                                                                                     class="fw-medium text-dark">UI/UX
                                                                                     Figma Design</a>
                                                                                <div class="ms-auto">
                                                                                     <a href="customer-list#!"
                                                                                          class="fw-medium text-primary fs-18"
                                                                                          data-bs-toggle="tooltip"
                                                                                          data-bs-title="Download"
                                                                                          data-bs-placement="bottom"><iconify-icon
                                                                                               icon="iconamoon:cloud-download-duotone"><template
                                                                                                    shadowrootmode="open">
                                                                                                    <style
                                                                                                         data-style="data-style">
                                                                                                         :host {
                                                                                                              display: inline-block;
                                                                                                              vertical-align: 0
                                                                                                         }

                                                                                                         span,
                                                                                                         svg {
                                                                                                              display: block
                                                                                                         }
                                                                                                    </style>
                                                                                               </template></iconify-icon></a>
                                                                                </div>
                                                                           </div>
                                                                           <h6 class="mt-3 text-muted">Monday , 3:00 PM
                                                                           </h6>
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
                                                                           <p>Get access to over 20+ pages including a
                                                                                dashboard layout, charts, kanban board,
                                                                                calendar, and pre-order E-commerce &amp;
                                                                                Marketing pages.</p>
                                                                           <div class="mt-2">
                                                                                <a href="customer-list#!"
                                                                                     class="btn btn-light btn-sm">Download
                                                                                     Zip</a>
                                                                           </div>
                                                                           <h6 class="mt-3 text-muted">Monday , 2:10 PM
                                                                           </h6>
                                                                      </div>
                                                                 </div>
                                                            </div>
                                                            <div class="position-relative ps-4">
                                                                 <div class="mb-4">
                                                                      <span
                                                                           class="position-absolute start-0 translate-middle-x bg-success bg-gradient d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><img
                                                                                src="../webPage/admin/assets/images/users/avatar-7.jpg"
                                                                                alt="avatar-5"
                                                                                class="avatar-sm rounded-circle"></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-0 text-dark fw-semibold fs-15 lh-base">
                                                                                Alex
                                                                                Smith Attached Photos
                                                                           </h5>
                                                                           <div class="row g-2 mt-2">
                                                                                <div class="col-lg-4">
                                                                                     <a href="role-list#!">
                                                                                          <img src="../webPage/admin/assets/images/small/img-6.jpg"
                                                                                               alt=""
                                                                                               class="img-fluid rounded">
                                                                                     </a>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                     <a href="role-list#!">
                                                                                          <img src="../webPage/admin/assets/images/small/img-3.jpg"
                                                                                               alt=""
                                                                                               class="img-fluid rounded">
                                                                                     </a>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                     <a href="role-list#!">
                                                                                          <img src="../webPage/admin/assets/images/small/img-4.jpg"
                                                                                               alt=""
                                                                                               class="img-fluid rounded">
                                                                                     </a>
                                                                                </div>
                                                                           </div>
                                                                           <h6 class="mt-3 text-muted">Monday 1:00 PM
                                                                           </h6>
                                                                      </div>
                                                                 </div>
                                                            </div>
                                                            <div class="position-relative ps-4">
                                                                 <div class="mb-4">
                                                                      <span
                                                                           class="position-absolute start-0 translate-middle-x bg-success bg-gradient d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><img
                                                                                src="../webPage/admin/assets/images/users/avatar-6.jpg"
                                                                                alt="avatar-5"
                                                                                class="avatar-sm rounded-circle"></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-0 text-dark fw-semibold fs-15 lh-base">
                                                                                Rebecca
                                                                                J. added a new team member
                                                                           </h5>
                                                                           <p class="d-flex align-items-center gap-1">
                                                                                <iconify-icon
                                                                                     icon="iconamoon:check-circle-1-duotone"
                                                                                     class="text-success"><template
                                                                                          shadowrootmode="open">
                                                                                          <style
                                                                                               data-style="data-style">
                                                                                               :host {
                                                                                                    display: inline-block;
                                                                                                    vertical-align: 0
                                                                                               }

                                                                                               span,
                                                                                               svg {
                                                                                                    display: block
                                                                                               }
                                                                                          </style>
                                                                                     </template></iconify-icon> Added a
                                                                                new member to
                                                                                Front Dashboard</p>
                                                                           <h6 class="mt-3 text-muted">Monday 10:00 AM
                                                                           </h6>
                                                                      </div>
                                                                 </div>
                                                            </div>
                                                            <div class="position-relative ps-4">
                                                                 <div class="mb-4">
                                                                      <span
                                                                           class="position-absolute start-0 avatar-sm translate-middle-x bg-warning d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon
                                                                                icon="iconamoon:certificate-badge-duotone"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-0 text-dark fw-semibold fs-15 lh-base">
                                                                                Achievements
                                                                           </h5>
                                                                           <p
                                                                                class="d-flex align-items-center gap-1 mt-1">
                                                                                Earned a <iconify-icon
                                                                                     icon="iconamoon:certificate-badge-duotone"
                                                                                     class="text-danger fs-20"><template
                                                                                          shadowrootmode="open">
                                                                                          <style
                                                                                               data-style="data-style">
                                                                                               :host {
                                                                                                    display: inline-block;
                                                                                                    vertical-align: 0
                                                                                               }

                                                                                               span,
                                                                                               svg {
                                                                                                    display: block
                                                                                               }
                                                                                          </style>
                                                                                     </template></iconify-icon>" Best
                                                                                Product Award"</p>
                                                                           <h6 class="mt-3 text-muted">Monday 9:30 AM
                                                                           </h6>
                                                                      </div>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <a href="customer-list#!"
                                                            class="btn btn-outline-dark w-100">View All</a>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="simplebar-placeholder" style="width: auto; height: 1101px;"></div>
                              </div>
                              <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
                                   <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
                              </div>
                              <div class="simplebar-track simplebar-vertical" style="visibility: visible;">
                                   <div class="simplebar-scrollbar"
                                        style="height: 361px; transform: translate3d(0px, 0px, 0px); display: block;">
                                   </div>
                              </div>
                         </div>
                    </div>
               </div>
          </div>

          <!-- Right Sidebar (Theme Settings) -->
          <div>
               <div class="offcanvas offcanvas-end border-0" tabindex="-1" id="theme-settings-offcanvas">
                    <div class="d-flex align-items-center bg-primary p-3 offcanvas-header">
                         <h5 class="text-white m-0">Theme Settings</h5>
                         <button type="button" class="btn-close btn-close-white ms-auto" data-bs-dismiss="offcanvas"
                              aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body p-0">
                         <div data-simplebar="init" class="h-100">
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
                                                       <div class="p-3 settings-bar">

                                                            <div>
                                                                 <h5 class="mb-3 font-16 fw-semibold">Color Scheme</h5>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-bs-theme" id="layout-color-light"
                                                                           value="light">
                                                                      <label class="form-check-label"
                                                                           for="layout-color-light">Light</label>
                                                                 </div>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-bs-theme" id="layout-color-dark"
                                                                           value="dark">
                                                                      <label class="form-check-label"
                                                                           for="layout-color-dark">Dark</label>
                                                                 </div>
                                                            </div>

                                                            <div>
                                                                 <h5 class="my-3 font-16 fw-semibold">Topbar Color</h5>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-topbar-color"
                                                                           id="topbar-color-light" value="light">
                                                                      <label class="form-check-label"
                                                                           for="topbar-color-light">Light</label>
                                                                 </div>
                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-topbar-color"
                                                                           id="topbar-color-dark" value="dark">
                                                                      <label class="form-check-label"
                                                                           for="topbar-color-dark">Dark</label>
                                                                 </div>
                                                            </div>


                                                            <div>
                                                                 <h5 class="my-3 font-16 fw-semibold">Menu Color</h5>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-color"
                                                                           id="leftbar-color-light" value="light">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-color-light">
                                                                           Light
                                                                      </label>
                                                                 </div>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-color"
                                                                           id="leftbar-color-dark" value="dark">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-color-dark">
                                                                           Dark
                                                                      </label>
                                                                 </div>
                                                            </div>

                                                            <div>
                                                                 <h5 class="my-3 font-16 fw-semibold">Sidebar Size</h5>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-size"
                                                                           id="leftbar-size-default" value="default">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-size-default">
                                                                           Default
                                                                      </label>
                                                                 </div>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-size" id="leftbar-size-small"
                                                                           value="condensed">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-size-small">
                                                                           Condensed
                                                                      </label>
                                                                 </div>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-size" id="leftbar-hidden"
                                                                           value="hidden">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-hidden">
                                                                           Hidden
                                                                      </label>
                                                                 </div>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-size"
                                                                           id="leftbar-size-small-hover-active"
                                                                           value="sm-hover-active">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-size-small-hover-active">
                                                                           Small Hover Active
                                                                      </label>
                                                                 </div>

                                                                 <div class="form-check mb-2">
                                                                      <input class="form-check-input" type="radio"
                                                                           name="data-menu-size"
                                                                           id="leftbar-size-small-hover"
                                                                           value="sm-hover">
                                                                      <label class="form-check-label"
                                                                           for="leftbar-size-small-hover">
                                                                           Small Hover
                                                                      </label>
                                                                 </div>
                                                            </div>

                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="simplebar-placeholder" style="width: auto; height: 609px;"></div>
                              </div>
                              <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
                                   <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
                              </div>
                              <div class="simplebar-track simplebar-vertical" style="visibility: visible;">
                                   <div class="simplebar-scrollbar"
                                        style="height: 484px; transform: translate3d(0px, 0px, 0px); display: block;">
                                   </div>
                              </div>
                         </div>
                    </div>
                    <div class="offcanvas-footer border-top p-3 text-center">
                         <div class="row">
                              <div class="col">
                                   <button type="button" class="btn btn-danger w-100" id="reset-layout">Reset</button>
                              </div>
                         </div>
                    </div>
               </div>
          </div>
          <!-- ========== Topbar End ========== -->

          <!-- ========== App Menu Start ========== -->
          <div class="main-nav">
               <!-- Sidebar Logo -->
               <div class="logo-box">
                    <a href="admin/home" class="logo-dark">
                         <img src="../webPage/admin/assets/images/logo-sm.png" class="logo-sm" alt="logo sm">
                         <img src="../webPage/admin/assets/images/logo-dark.png" class="logo-lg" alt="logo dark">
                    </a>

                    <a href="admin/home" class="logo-light">
                         <img src="../webPage/admin/assets/images/logo-sm.png" class="logo-sm" alt="logo sm">
                         <img src="../webPage/admin/assets/images/logo-light.png" class="logo-lg" alt="logo light">
                    </a>
               </div>

               <!-- Menu Toggle Button (sm-hover) -->
               <button type="button" class="button-sm-hover" aria-label="Show Full Sidebar">
                    <iconify-icon icon="solar:double-alt-arrow-right-bold-duotone"
                         class="button-sm-hover-icon"><template shadowrootmode="open">
                              <style data-style="data-style">
                                   :host {
                                        display: inline-block;
                                        vertical-align: 0
                                   }

                                   span,
                                   svg {
                                        display: block
                                   }
                              </style><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                   viewBox="0 0 24 24">
                                   <path fill="currentColor"
                                        d="M6.25 19a.75.75 0 0 0 1.32.488l6-7a.75.75 0 0 0 0-.976l-6-7A.75.75 0 0 0 6.25 5z"
                                        opacity=".5"></path>
                                   <path fill="currentColor" fill-rule="evenodd"
                                        d="M10.512 19.57a.75.75 0 0 1-.081-1.058L16.012 12l-5.581-6.512a.75.75 0 1 1 1.139-.976l6 7a.75.75 0 0 1 0 .976l-6 7a.75.75 0 0 1-1.058.082"
                                        clip-rule="evenodd"></path>
                              </svg>
                         </template></iconify-icon>
               </button>

               <div class="scrollbar" data-simplebar="init">
                    <div class="simplebar-wrapper" style="margin: 0px;">
                         <div class="simplebar-height-auto-observer-wrapper">
                              <div class="simplebar-height-auto-observer"></div>
                         </div>
                         <div class="simplebar-mask">
                              <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                                   <div class="simplebar-content-wrapper" tabindex="0" role="region"
                                        aria-label="scrollable content" style="height: 100%; overflow: hidden scroll;">
                                        <div class="simplebar-content" style="padding: 0px;">
                                             <ul class="navbar-nav" id="navbar-nav">

                                                  <li class="menu-title">General</li>

                                                  <li class="nav-item active">
                                                       <a class="nav-link active" href="admin/home">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:widget-5-bold-duotone"><template
                                                                           shadowrootmode="open">
                                                                           <style data-style="data-style">
                                                                                :host {
                                                                                     display: inline-block;
                                                                                     vertical-align: 0
                                                                                }

                                                                                span,
                                                                                svg {
                                                                                     display: block
                                                                                }
                                                                           </style><svg
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="1em" height="1em"
                                                                                viewBox="0 0 24 24">
                                                                                <path fill="currentColor"
                                                                                     d="M13 15.4c0-2.074 0-3.111.659-3.756S15.379 11 17.5 11s3.182 0 3.841.644C22 12.29 22 13.326 22 15.4v2.2c0 2.074 0 3.111-.659 3.756S19.621 22 17.5 22s-3.182 0-3.841-.644C13 20.71 13 19.674 13 17.6z"
                                                                                     opacity=".5"></path>
                                                                                <path fill="currentColor"
                                                                                     d="M2 8.6c0 2.074 0 3.111.659 3.756S4.379 13 6.5 13s3.182 0 3.841-.644C11 11.71 11 10.674 11 8.6V6.4c0-2.074 0-3.111-.659-3.756S8.621 2 6.5 2s-3.182 0-3.841.644C2 3.29 2 4.326 2 6.4zm11-3.1c0-1.087 0-1.63.171-2.06a2.3 2.3 0 0 1 1.218-1.262C14.802 2 15.327 2 16.375 2h2.25c1.048 0 1.573 0 1.986.178c.551.236.99.69 1.218 1.262c.171.43.171.973.171 2.06s0 1.63-.171 2.06a2.3 2.3 0 0 1-1.218 1.262C20.198 9 19.673 9 18.625 9h-2.25c-1.048 0-1.573 0-1.986-.178a2.3 2.3 0 0 1-1.218-1.262C13 7.13 13 6.587 13 5.5">
                                                                                </path>
                                                                                <path fill="currentColor"
                                                                                     d="M2 18.5c0 1.087 0 1.63.171 2.06a2.3 2.3 0 0 0 1.218 1.262c.413.178.938.178 1.986.178h2.25c1.048 0 1.573 0 1.986-.178c.551-.236.99-.69 1.218-1.262c.171-.43.171-.973.171-2.06s0-1.63-.171-2.06a2.3 2.3 0 0 0-1.218-1.262C9.198 15 8.673 15 7.625 15h-2.25c-1.048 0-1.573 0-1.986.178c-.551.236-.99.69-1.218 1.262C2 16.87 2 17.413 2 18.5"
                                                                                     opacity=".5"></path>
                                                                           </svg>
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Dashboard </span>
                                                       </a>
                                                  </li>

                                                  <li class="nav-item">
                                                       <a class="nav-link menu-arrow" href="index#sidebarProducts"
                                                            data-bs-toggle="collapse" role="button"
                                                            aria-expanded="false" aria-controls="sidebarProducts">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:t-shirt-bold-duotone"><template
                                                                           shadowrootmode="open">
                                                                           <style data-style="data-style">
                                                                                :host {
                                                                                     display: inline-block;
                                                                                     vertical-align: 0
                                                                                }

                                                                                span,
                                                                                svg {
                                                                                     display: block
                                                                                }
                                                                           </style><svg
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="1em" height="1em"
                                                                                viewBox="0 0 24 24">
                                                                                <path fill="currentColor"
                                                                                     fill-rule="evenodd"
                                                                                     d="M5.777 18.265v-7.97c0-.683 0-1.025-.132-1.326c-.131-.3-.378-.523-.871-.968l-.186-.167C3.532 6.882 3.004 6.405 3 5.716c-.004-.69.464-1.122 1.401-1.988q.214-.197.418-.362c.472-.378 1.138-.792 1.648-1.09a2.05 2.05 0 0 1 1.567-.205l.49.129c.389.102.727.353.949.703c.6.948 1.564 1.423 2.527 1.423V22c-1.467 0-2.724-.148-3.716-.33c-1.073-.198-1.61-.296-2.058-.858c-.45-.562-.45-1.224-.45-2.547"
                                                                                     clip-rule="evenodd"></path>
                                                                                <path fill="currentColor"
                                                                                     d="M18.223 18.265v-7.97c0-.683 0-1.025.132-1.326c.131-.3.378-.523.871-.968l.186-.167c1.056-.952 1.584-1.429 1.588-2.118c.004-.69-.465-1.122-1.401-1.988a8 8 0 0 0-.418-.362c-.472-.378-1.138-.792-1.648-1.09a2.05 2.05 0 0 0-1.567-.205l-.49.129a1.6 1.6 0 0 0-.949.703c-.6.948-1.564 1.423-2.527 1.423V22c1.467 0 2.724-.148 3.716-.33c1.073-.198 1.61-.296 2.059-.858c.448-.562.448-1.224.448-2.547"
                                                                                     opacity=".5"></path>
                                                                           </svg>
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Products </span>
                                                       </a>
                                                       <div class="collapse" id="sidebarProducts">
                                                            <ul class="nav sub-navbar-nav">
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-list">List</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-grid">Grid</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-details">Details</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-edit">Edit</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-add">Create</a>
                                                                 </li>
                                                            </ul>
                                                       </div>
                                                  </li>



                                                  

                                                  <li class="nav-item">
                                                       <a class="nav-link menu-arrow" href="index#sidebarOrders"
                                                            data-bs-toggle="collapse" role="button"
                                                            aria-expanded="false" aria-controls="sidebarOrders">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:bag-smile-bold-duotone"><template
                                                                           shadowrootmode="open">
                                                                           <style data-style="data-style">
                                                                                :host {
                                                                                     display: inline-block;
                                                                                     vertical-align: 0
                                                                                }

                                                                                span,
                                                                                svg {
                                                                                     display: block
                                                                                }
                                                                           </style><svg
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="1em" height="1em"
                                                                                viewBox="0 0 24 24">
                                                                                <path fill="currentColor"
                                                                                     d="M4.083 11.894c.439-2.34.658-3.511 1.491-4.203C6.408 7 7.598 7 9.98 7h4.04c2.383 0 3.573 0 4.407.691c.833.692 1.052 1.862 1.491 4.203l.75 4c.617 3.292.926 4.938.026 6.022S18.12 23 14.771 23H9.23c-3.349 0-5.024 0-5.923-1.084c-.9-1.084-.591-2.73.026-6.022z"
                                                                                     opacity=".5"></path>
                                                                                <path fill="currentColor"
                                                                                     d="M9.75 5.985a2.25 2.25 0 0 1 4.5 0v1c.566 0 1.062.002 1.5.015V5.985a3.75 3.75 0 1 0-7.5 0V7c.438-.013.934-.015 1.5-.015zm.128 9.765a2.251 2.251 0 0 0 4.245 0a.75.75 0 1 1 1.414.5a3.751 3.751 0 0 1-7.073 0a.75.75 0 0 1 1.414-.5">
                                                                                </path>
                                                                           </svg>
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Orders </span>
                                                       </a>
                                                       <div class="collapse" id="sidebarOrders">
                                                            <ul class="nav sub-navbar-nav">

                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="orders-list">List</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="order-detail">Details</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="order-cart">Cart</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="order-checkout">Check
                                                                           Out</a>
                                                                 </li>
                                                            </ul>
                                                       </div>
                                                  </li>

                                                 

                                                
                              


                                                  <li class="menu-title mt-2">Users</li>

                                                  <li class="nav-item">
                                                       <a class="nav-link" href="pages-profile">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:chat-square-like-bold-duotone"><template
                                                                           shadowrootmode="open">
                                                                           <style data-style="data-style">
                                                                                :host {
                                                                                     display: inline-block;
                                                                                     vertical-align: 0
                                                                                }

                                                                                span,
                                                                                svg {
                                                                                     display: block
                                                                                }
                                                                           </style><svg
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="1em" height="1em"
                                                                                viewBox="0 0 24 24">
                                                                                <path fill="currentColor"
                                                                                     d="m13.629 20.472l-.542.916c-.483.816-1.69.816-2.174 0l-.542-.916c-.42-.71-.63-1.066-.968-1.262c-.338-.197-.763-.204-1.613-.219c-1.256-.021-2.043-.098-2.703-.372a5 5 0 0 1-2.706-2.706C2 14.995 2 13.83 2 11.5v-1c0-3.273 0-4.91.737-6.112a5 5 0 0 1 1.65-1.651C5.59 2 7.228 2 10.5 2h3c3.273 0 4.91 0 6.113.737a5 5 0 0 1 1.65 1.65C22 5.59 22 7.228 22 10.5v1c0 2.33 0 3.495-.38 4.413a5 5 0 0 1-2.707 2.706c-.66.274-1.447.35-2.703.372c-.85.015-1.275.022-1.613.219c-.338.196-.548.551-.968 1.262"
                                                                                     opacity=".5"></path>
                                                                                <path fill="currentColor"
                                                                                     d="M10.99 14.308c-1.327-.978-3.49-2.84-3.49-4.593c0-2.677 2.475-3.677 4.5-1.609c2.025-2.068 4.5-1.068 4.5 1.609c0 1.752-2.163 3.615-3.49 4.593c-.454.335-.681.502-1.01.502s-.556-.167-1.01-.502">
                                                                                </path>
                                                                           </svg>
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Profile </span>
                                                       </a>
                                                  </li>

                                                  <li class="nav-item">
                                                       <a class="nav-link menu-arrow" href="index#sidebarRoles"
                                                            data-bs-toggle="collapse" role="button"
                                                            aria-expanded="false" aria-controls="sidebarRoles">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:user-speak-rounded-bold-duotone"><template
                                                                           shadowrootmode="open">
                                                                           <style data-style="data-style">
                                                                                :host {
                                                                                     display: inline-block;
                                                                                     vertical-align: 0
                                                                                }

                                                                                span,
                                                                                svg {
                                                                                     display: block
                                                                                }
                                                                           </style><svg
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                width="1em" height="1em"
                                                                                viewBox="0 0 24 24">
                                                                                <circle cx="10" cy="6.75" r="4"
                                                                                     fill="currentColor"></circle>
                                                                                <ellipse cx="10" cy="17.75"
                                                                                     fill="currentColor" opacity=".5"
                                                                                     rx="7" ry="4"></ellipse>
                                                                                <path fill="currentColor"
                                                                                     fill-rule="evenodd"
                                                                                     d="M18.357 2.364a.75.75 0 0 1 1.029-.257L19 2.75l.386-.643h.001l.002.002l.004.002l.01.006l.113.076c.07.049.166.12.277.212c.222.185.512.462.802.838c.582.758 1.155 1.914 1.155 3.507s-.573 2.75-1.155 3.507c-.29.376-.58.653-.802.838a4 4 0 0 1-.363.27l-.028.018l-.01.006l-.003.002l-.002.001s-.001.001-.387-.642l.386.643a.75.75 0 0 1-.776-1.283l.005-.004l.041-.027q.06-.042.177-.136c.152-.128.362-.326.573-.6c.417-.542.844-1.386.844-2.593s-.427-2.05-.844-2.593a3.8 3.8 0 0 0-.573-.6a3 3 0 0 0-.218-.163l-.005-.003a.75.75 0 0 1-.253-1.027"
                                                                                     clip-rule="evenodd"></path>
                                                                                <path fill="currentColor"
                                                                                     fill-rule="evenodd"
                                                                                     d="M16.33 4.415a.75.75 0 0 1 1.006-.336L17 4.75l.336-.67h.001l.002.001l.004.002l.008.004l.022.012a2 2 0 0 1 .233.153c.136.102.31.254.48.467c.349.436.664 1.099.664 2.031s-.316 1.595-.664 2.031a2.7 2.7 0 0 1-.654.586l-.06.034l-.02.012l-.01.004l-.003.002l-.002.001l-.33-.657l.329.658a.75.75 0 0 1-.685-1.335l.003-.001l.052-.036c.052-.04.13-.106.209-.205c.15-.189.335-.526.335-1.094s-.184-.905-.335-1.094a1.2 1.2 0 0 0-.261-.24l-.003-.002a.75.75 0 0 1-.322-1"
                                                                                     clip-rule="evenodd"></path>
                                                                           </svg>
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Roles </span>
                                                       </a>
                                                       <div class="collapse" id="sidebarRoles">
                                                            <ul class="nav sub-navbar-nav">
                                                                 <ul class="nav sub-navbar-nav">
                                                                      <li class="sub-nav-item">
                                                                           <a class="sub-nav-link"
                                                                                href="role-list">List</a>
                                                                      </li>
                                                                      <li class="sub-nav-item">
                                                                           <a class="sub-nav-link"
                                                                                href="role-edit">Edit</a>
                                                                      </li>
                                                                      <li class="sub-nav-item">
                                                                           <a class="sub-nav-link"
                                                                                href="role-add">Create</a>
                                                                      </li>
                                                                 </ul>
                                                            </ul>
                                                       </div>
                                                  </li>

                                                  

                                                  <li class="nav-item">
                                                       <a class="nav-link menu-arrow" href="index#sidebarCustomers"
                                                            data-bs-toggle="collapse" role="button"
                                                            aria-expanded="false" aria-controls="sidebarCustomers">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:users-group-two-rounded-bold-duotone"><template
                                                                           shadowrootmode="open">
                                                                           <style data-style="data-style">
                                                                                :host {
                                                                                     display: inline-block;
                                                                                     vertical-align: 0
                                                                                }

                                                                                span,
                                                                                svg {
                                                                                     display: block
                                                                                }
                                                                           </style>
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Customers </span>
                                                       </a>
                                                       <div class="collapse" id="sidebarCustomers">
                                                            <ul class="nav sub-navbar-nav">

                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="customer-list">List</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="customer-detail">Details</a>
                                                                 </li>
                                                            </ul>
                                                       </div>
                                                  </li>

                                                 

                                                  <li class="menu-title mt-2">Other</li>

                                                  <li class="nav-item">
                                                       <a class="nav-link menu-arrow" href="index#sidebarCoupons"
                                                            data-bs-toggle="collapse" role="button"
                                                            aria-expanded="false" aria-controls="sidebarCoupons">
                                                            <span class="nav-icon">
                                                                 <iconify-icon icon="solar:leaf-bold-duotone"><template
                                                                           shadowrootmode="open">
                                                                           <style data-style="data-style">
                                                                                :host {
                                                                                     display: inline-block;
                                                                                     vertical-align: 0
                                                                                }

                                                                                span,
                                                                                svg {
                                                                                     display: block
                                                                                }
                                                                           </style>
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Coupons </span>
                                                       </a>
                                                       <div class="collapse" id="sidebarCoupons">
                                                            <ul class="nav sub-navbar-nav">
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="coupons-list">List</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="coupons-add">Add</a>
                                                                 </li>
                                                            </ul>
                                                       </div>
                                                  </li>

                                                  <li class="nav-item">
                                                       <a class="nav-link" href="pages-review">
                                                            <span class="nav-icon">
                                                                 <iconify-icon
                                                                      icon="solar:chat-square-like-bold-duotone"><template
                                                                           shadowrootmode="open">
                                                                           <style data-style="data-style">
                                                                                :host {
                                                                                     display: inline-block;
                                                                                     vertical-align: 0
                                                                                }

                                                                                span,
                                                                                svg {
                                                                                     display: block
                                                                                }
                                                                           </style>
                                                                      </template></iconify-icon>
                                                            </span>
                                                            <span class="nav-text"> Reviews </span>
                                                       </a>
                                                  </li>

                                                  <li class="menu-title mt-2">Other Apps</li>

                                                 

                                                  

                                                  

                         
                                                  <li class="menu-title mt-2">Custom</li>

                                                

                                                  

                                                  

                                                  <li class="menu-title mt-2">Components</li>
                                             </ul>
                                        </div>
                                   </div>
                              </div>
                         </div>
                         <div class="simplebar-placeholder" style="width: auto; height: 1738px;"></div>
                    </div>
                    <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
                         <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
                    </div>
                    <div class="simplebar-track simplebar-vertical" style="visibility: visible;">
                         <div class="simplebar-scrollbar"
                              style="height: 187px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
                    </div>
               </div>
          </div>
          <!-- ========== App Menu End ========== -->

          <!-- ==================================================== -->
          <!-- Start right Content here -->
          <!-- ==================================================== -->

          <div class="page-content">

               <!-- Start Container Fluid -->
               <div class="container-xxl">

                    <div class="row">
                         <div class="col-md-6 col-xl-3">
                              <div class="card">
                                   <div class="card-body">
                                        <div class="d-flex align-items-center gap-2 mb-3">
                                             <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                  <iconify-icon icon="solar:users-group-two-rounded-bold-duotone"
                                                       class="fs-32 text-primary avatar-title"><template
                                                            shadowrootmode="open">
                                                            <style data-style="data-style">
                                                                 :host {
                                                                      display: inline-block;
                                                                      vertical-align: 0
                                                                 }

                                                                 span,
                                                                 svg {
                                                                      display: block
                                                                 }
                                                            </style><svg xmlns="http://www.w3.org/2000/svg" width="1em"
                                                                 height="1em" viewBox="0 0 24 24">
                                                                 <path fill="currentColor"
                                                                      d="M15.5 7.5a3.5 3.5 0 1 1-7 0a3.5 3.5 0 0 1 7 0">
                                                                 </path>
                                                                 <path fill="currentColor"
                                                                      d="M19.5 7.5a2.5 2.5 0 1 1-5 0a2.5 2.5 0 0 1 5 0m-15 0a2.5 2.5 0 1 0 5 0a2.5 2.5 0 0 0-5 0"
                                                                      opacity=".4"></path>
                                                                 <path fill="currentColor"
                                                                      d="M18 16.5c0 1.933-2.686 3.5-6 3.5s-6-1.567-6-3.5S8.686 13 12 13s6 1.567 6 3.5">
                                                                 </path>
                                                                 <path fill="currentColor"
                                                                      d="M22 16.5c0 1.38-1.79 2.5-4 2.5s-4-1.12-4-2.5s1.79-2.5 4-2.5s4 1.12 4 2.5m-20 0C2 17.88 3.79 19 6 19s4-1.12 4-2.5S8.21 14 6 14s-4 1.12-4 2.5"
                                                                      opacity=".4"></path>
                                                            </svg>
                                                       </template></iconify-icon>
                                             </div>
                                             <div>
                                                  <h4 class="mb-0">All Customers</h4>
                                             </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                             <p class="text-muted fw-medium fs-22 mb-0">+22.63k</p>
                                             <div>
                                                  <span class="badge text-success bg-success-subtle fs-12"><i
                                                            class="bx bx-up-arrow-alt"></i>34.4%</span>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>
                         <div class="col-md-6 col-xl-3">
                              <div class="card">
                                   <div class="card-body">
                                        <div class="d-flex align-items-center gap-2 mb-3">
                                             <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                  <iconify-icon icon="solar:box-bold-duotone"
                                                       class="fs-32 text-primary avatar-title"><template
                                                            shadowrootmode="open">
                                                            <style data-style="data-style">
                                                                 :host {
                                                                      display: inline-block;
                                                                      vertical-align: 0
                                                                 }

                                                                 span,
                                                                 svg {
                                                                      display: block
                                                                 }
                                                            </style><svg xmlns="http://www.w3.org/2000/svg" width="1em"
                                                                 height="1em" viewBox="0 0 24 24">
                                                                 <path fill="currentColor"
                                                                      d="M8.422 20.618C10.178 21.54 11.056 22 12 22V12L2.638 7.073l-.04.067C2 8.154 2 9.417 2 11.942v.117c0 2.524 0 3.787.597 4.801c.598 1.015 1.674 1.58 3.825 2.709z">
                                                                 </path>
                                                                 <path fill="currentColor"
                                                                      d="m17.577 4.432l-2-1.05C13.822 2.461 12.944 2 12 2c-.945 0-1.822.46-3.578 1.382l-2 1.05C4.318 5.536 3.242 6.1 2.638 7.072L12 12l9.362-4.927c-.606-.973-1.68-1.537-3.785-2.641"
                                                                      opacity=".7"></path>
                                                                 <path fill="currentColor"
                                                                      d="m21.403 7.14l-.041-.067L12 12v10c.944 0 1.822-.46 3.578-1.382l2-1.05c2.151-1.129 3.227-1.693 3.825-2.708c.597-1.014.597-2.277.597-4.8v-.117c0-2.525 0-3.788-.597-4.802"
                                                                      opacity=".5"></path>
                                                                 <path fill="currentColor"
                                                                      d="m6.323 4.484l.1-.052l1.493-.784l9.1 5.005l4.025-2.011q.205.232.362.498c.15.254.262.524.346.825L17.75 9.964V13a.75.75 0 0 1-1.5 0v-2.286l-3.5 1.75v9.44A3 3 0 0 1 12 22c-.248 0-.493-.032-.75-.096v-9.44l-8.998-4.5c.084-.3.196-.57.346-.824q.156-.266.362-.498l9.04 4.52l3.387-1.693z">
                                                                 </path>
                                                            </svg>
                                                       </template></iconify-icon>
                                             </div>
                                             <div>
                                                  <h4 class="mb-0">Orders</h4>
                                             </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                             <p class="text-muted fw-medium fs-22 mb-0">+4.5k</p>
                                             <div>
                                                  <span class="badge text-danger bg-danger-subtle fs-12"><i
                                                            class="bx bx-down-arrow-alt"></i>8.1%</span>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>

                         <div class="col-md-6 col-xl-3">
                              <div class="card">
                                   <div class="card-body">
                                        <div class="d-flex align-items-center gap-2 mb-3">
                                             <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                  <iconify-icon icon="solar:headphones-round-sound-bold-duotone"
                                                       class="fs-32 text-primary avatar-title"><template
                                                            shadowrootmode="open">
                                                            <style data-style="data-style">
                                                                 :host {
                                                                      display: inline-block;
                                                                      vertical-align: 0
                                                                 }

                                                                 span,
                                                                 svg {
                                                                      display: block
                                                                 }
                                                            </style><svg xmlns="http://www.w3.org/2000/svg" width="1em"
                                                                 height="1em" viewBox="0 0 24 24">
                                                                 <path fill="currentColor"
                                                                      d="M2 12.124C2 6.533 6.477 2 12 2s10 4.533 10 10.124v5.243c0 .817 0 1.378-.143 1.87a3.52 3.52 0 0 1-1.847 2.188c-.458.22-1.004.307-1.801.434l-.13.02a13 13 0 0 1-.727.105c-.209.02-.422.027-.64-.016a2.1 2.1 0 0 1-1.561-1.35a2.2 2.2 0 0 1-.116-.639c-.012-.204-.012-.452-.012-.742v-4.173c0-.425 0-.791.097-1.105a2.1 2.1 0 0 1 1.528-1.43c.316-.073.677-.044 1.096-.01l.093.007l.11.01c.783.062 1.32.104 1.775.275q.481.181.883.487v-1.174c0-4.811-3.853-8.711-8.605-8.711s-8.605 3.9-8.605 8.711v1.174c.267-.203.563-.368.883-.487c.455-.17.992-.213 1.775-.276l.11-.009l.093-.007c.42-.034.78-.063 1.096.01a2.1 2.1 0 0 1 1.528 1.43c.098.314.097.68.097 1.105v4.172c0 .291 0 .54-.012.743c-.012.213-.04.427-.116.638a2.1 2.1 0 0 1-1.56 1.35a2.2 2.2 0 0 1-.641.017c-.201-.02-.444-.059-.727-.104l-.13-.02c-.797-.128-1.344-.215-1.801-.436a3.52 3.52 0 0 1-1.847-2.188c-.118-.405-.139-.857-.142-1.461L2 17.58z">
                                                                 </path>
                                                                 <path fill="currentColor" fill-rule="evenodd"
                                                                      d="M12 5.75a.75.75 0 0 1 .75.75v5a.75.75 0 0 1-1.5 0v-5a.75.75 0 0 1 .75-.75m3 1.5a.75.75 0 0 1 .75.75v2a.75.75 0 0 1-1.5 0V8a.75.75 0 0 1 .75-.75m-6 0a.75.75 0 0 1 .75.75v2a.75.75 0 0 1-1.5 0V8A.75.75 0 0 1 9 7.25"
                                                                      clip-rule="evenodd" opacity=".5"></path>
                                                            </svg>
                                                       </template></iconify-icon>
                                             </div>
                                             <div>
                                                  <h4 class="mb-0">Services Request</h4>
                                             </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                             <p class="text-muted fw-medium fs-22 mb-0">+1.03k</p>
                                             <div>
                                                  <span class="badge text-success bg-success-subtle fs-12"><i
                                                            class="bx bx-up-arrow-alt"></i>12.6%</span>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>

                         <div class="col-md-6 col-xl-3">
                              <div class="card">
                                   <div class="card-body">
                                        <div class="d-flex align-items-center gap-2 mb-3">
                                             <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                  <iconify-icon icon="solar:bill-list-bold-duotone"
                                                       class="fs-32 text-primary avatar-title"><template
                                                            shadowrootmode="open">
                                                            <style data-style="data-style">
                                                                 :host {
                                                                      display: inline-block;
                                                                      vertical-align: 0
                                                                 }

                                                                 span,
                                                                 svg {
                                                                      display: block
                                                                 }
                                                            </style><svg xmlns="http://www.w3.org/2000/svg" width="1em"
                                                                 height="1em" viewBox="0 0 24 24">
                                                                 <path fill="currentColor"
                                                                      d="M7.245 2h9.51c1.159 0 1.738 0 2.206.163a3.05 3.05 0 0 1 1.881 1.936C21 4.581 21 5.177 21 6.37v14.004c0 .858-.985 1.314-1.608.744a.946.946 0 0 0-1.284 0l-.483.442a1.657 1.657 0 0 1-2.25 0a1.657 1.657 0 0 0-2.25 0a1.657 1.657 0 0 1-2.25 0a1.657 1.657 0 0 0-2.25 0a1.657 1.657 0 0 1-2.25 0l-.483-.442a.946.946 0 0 0-1.284 0c-.623.57-1.608.114-1.608-.744V6.37c0-1.193 0-1.79.158-2.27c.3-.913.995-1.629 1.881-1.937C5.507 2 6.086 2 7.245 2"
                                                                      opacity=".5"></path>
                                                                 <path fill="currentColor"
                                                                      d="M7 6.75a.75.75 0 0 0 0 1.5h.5a.75.75 0 0 0 0-1.5zm3.5 0a.75.75 0 0 0 0 1.5H17a.75.75 0 0 0 0-1.5zM7 10.25a.75.75 0 0 0 0 1.5h.5a.75.75 0 0 0 0-1.5zm3.5 0a.75.75 0 0 0 0 1.5H17a.75.75 0 0 0 0-1.5zM7 13.75a.75.75 0 0 0 0 1.5h.5a.75.75 0 0 0 0-1.5zm3.5 0a.75.75 0 0 0 0 1.5H17a.75.75 0 0 0 0-1.5z">
                                                                 </path>
                                                            </svg>
                                                       </template></iconify-icon>
                                             </div>
                                             <div>
                                                  <h4 class="mb-0">Invoice &amp; Payment</h4>
                                             </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                             <p class="text-muted fw-medium fs-22 mb-0">$38,908.00</p>
                                             <div>
                                                  <span class="badge text-success bg-success-subtle fs-12"><i
                                                            class="bx bx-up-arrow-alt"></i>45.9%</span>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>

                    </div>

                    <div class="row">
                         <div class="col-xl-12">
                              <div class="card">
                                   <div class="d-flex card-header justify-content-between align-items-center">
                                        <div>
                                             <h4 class="card-title">All Customers List</h4>
                                        </div>
                                        <div class="dropdown">
                                             <a href="customer-list#"
                                                  class="dropdown-toggle btn btn-sm btn-outline-light rounded"
                                                  data-bs-toggle="dropdown" aria-expanded="false">
                                                  This Month
                                             </a>
                                             <div class="dropdown-menu dropdown-menu-end">
                                                  <!-- item-->
                                                  <a href="customer-list#!" class="dropdown-item">Download</a>
                                                  <!-- item-->
                                                  <a href="customer-list#!" class="dropdown-item">Export</a>
                                                  <!-- item-->
                                                  <a href="customer-list#!" class="dropdown-item">Import</a>
                                             </div>
                                        </div>
                                   </div>
                                   <div>
                                        <div class="table-responsive">
                                             <table class="table align-middle mb-0 table-hover table-centered">
                                                  <thead class="bg-light-subtle">
                                                       <tr>
                                                            <th style="width: 20px;">
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck1">
                                                                      <label class="form-check-label"
                                                                           for="customCheck1"></label>
                                                                 </div>
                                                            </th>
                                                            <th>Customer Name</th>
                                                            <th>Invoice ID</th>
                                                            <th>Status</th>
                                                            <th>Total Amount</th>
                                                            <th>Amount Due</th>
                                                            <th>Due Date</th>
                                                            <th>Payment Method</th>
                                                            <th>Action</th>
                                                       </tr>
                                                  </thead>
                                                  <tbody>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck2">
                                                                      <label class="form-check-label"
                                                                           for="customCheck2">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-2.jpg"
                                                                      class="avatar-sm rounded-circle me-2" alt="...">
                                                                 Michael A. Miner</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV2540</a> </td>
                                                            <td> <span
                                                                      class="badge bg-success-subtle text-success py-1 px-2">Completed</span>
                                                            </td>
                                                            <td> $4,521 </td>
                                                            <td> $8,901 </td>
                                                            <td> 07 Jan, 2023</td>
                                                            <td> Mastercard </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <g fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-width="1.5">
                                                                                               <path stroke-linecap="round"
                                                                                                    d="M9 4.46A9.8 9.8 0 0 1 12 4c4.182 0 7.028 2.5 8.725 4.704C21.575 9.81 22 10.361 22 12c0 1.64-.425 2.191-1.275 3.296C19.028 17.5 16.182 20 12 20s-7.028-2.5-8.725-4.704C2.425 14.192 2 13.639 2 12c0-1.64.425-2.191 1.275-3.296A14.5 14.5 0 0 1 5 6.821">
                                                                                               </path>
                                                                                               <path
                                                                                                    d="M15 12a3 3 0 1 1-6 0a3 3 0 0 1 6 0Z">
                                                                                               </path>
                                                                                          </g>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M4 22h4m12 0h-8m1.888-18.337l.742-.742a3.146 3.146 0 1 1 4.449 4.45l-.742.74m-4.449-4.448s.093 1.576 1.483 2.966s2.966 1.483 2.966 1.483m-4.449-4.45L7.071 10.48c-.462.462-.693.692-.891.947a5.2 5.2 0 0 0-.599.969c-.139.291-.242.601-.449 1.22l-.875 2.626m14.08-8.13L14.93 11.52m-3.41 3.41c-.462.462-.692.692-.947.891q-.451.352-.969.599c-.291.139-.601.242-1.22.448l-2.626.876m0 0l-.641.213a.848.848 0 0 1-1.073-1.073l.213-.641m1.501 1.5l-1.5-1.5">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M20.5 6h-17m5.67-2a3.001 3.001 0 0 1 5.66 0m3.544 11.4c-.177 2.654-.266 3.981-1.131 4.79s-2.195.81-4.856.81h-.774c-2.66 0-3.99 0-4.856-.81c-.865-.809-.953-2.136-1.13-4.79l-.46-6.9m13.666 0l-.2 3">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>

                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck3">
                                                                      <label class="form-check-label"
                                                                           for="customCheck3">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-3.jpg"
                                                                      class="avatar-sm rounded-circle me-2" alt="...">
                                                                 Theresa T. Brose</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV3924</a> </td>
                                                            <td> <span
                                                                      class="badge bg-danger-subtle text-danger px-2 py-1">Cancel</span>
                                                            </td>
                                                            <td> $7,836 </td>
                                                            <td> $9,902 </td>
                                                            <td> 03 Dec, 2023</td>
                                                            <td> Visa </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <g fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-width="1.5">
                                                                                               <path stroke-linecap="round"
                                                                                                    d="M9 4.46A9.8 9.8 0 0 1 12 4c4.182 0 7.028 2.5 8.725 4.704C21.575 9.81 22 10.361 22 12c0 1.64-.425 2.191-1.275 3.296C19.028 17.5 16.182 20 12 20s-7.028-2.5-8.725-4.704C2.425 14.192 2 13.639 2 12c0-1.64.425-2.191 1.275-3.296A14.5 14.5 0 0 1 5 6.821">
                                                                                               </path>
                                                                                               <path
                                                                                                    d="M15 12a3 3 0 1 1-6 0a3 3 0 0 1 6 0Z">
                                                                                               </path>
                                                                                          </g>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M4 22h4m12 0h-8m1.888-18.337l.742-.742a3.146 3.146 0 1 1 4.449 4.45l-.742.74m-4.449-4.448s.093 1.576 1.483 2.966s2.966 1.483 2.966 1.483m-4.449-4.45L7.071 10.48c-.462.462-.693.692-.891.947a5.2 5.2 0 0 0-.599.969c-.139.291-.242.601-.449 1.22l-.875 2.626m14.08-8.13L14.93 11.52m-3.41 3.41c-.462.462-.692.692-.947.891q-.451.352-.969.599c-.291.139-.601.242-1.22.448l-2.626.876m0 0l-.641.213a.848.848 0 0 1-1.073-1.073l.213-.641m1.501 1.5l-1.5-1.5">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M20.5 6h-17m5.67-2a3.001 3.001 0 0 1 5.66 0m3.544 11.4c-.177 2.654-.266 3.981-1.131 4.79s-2.195.81-4.856.81h-.774c-2.66 0-3.99 0-4.856-.81c-.865-.809-.953-2.136-1.13-4.79l-.46-6.9m13.666 0l-.2 3">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>

                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck4">
                                                                      <label class="form-check-label"
                                                                           for="customCheck4">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-4.jpg"
                                                                      class="avatar-sm rounded-circle me-2" alt="...">
                                                                 James L. Erickson</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV5032</a> </td>
                                                            <td>
                                                                 <span
                                                                      class="badge bg-success-subtle text-success py-1 px-2">Completed</span>
                                                            </td>
                                                            <td> $1,347 </td>
                                                            <td> $6,718 </td>
                                                            <td> 28 Sep, 2023 </td>
                                                            <td> Paypal </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <g fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-width="1.5">
                                                                                               <path stroke-linecap="round"
                                                                                                    d="M9 4.46A9.8 9.8 0 0 1 12 4c4.182 0 7.028 2.5 8.725 4.704C21.575 9.81 22 10.361 22 12c0 1.64-.425 2.191-1.275 3.296C19.028 17.5 16.182 20 12 20s-7.028-2.5-8.725-4.704C2.425 14.192 2 13.639 2 12c0-1.64.425-2.191 1.275-3.296A14.5 14.5 0 0 1 5 6.821">
                                                                                               </path>
                                                                                               <path
                                                                                                    d="M15 12a3 3 0 1 1-6 0a3 3 0 0 1 6 0Z">
                                                                                               </path>
                                                                                          </g>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M4 22h4m12 0h-8m1.888-18.337l.742-.742a3.146 3.146 0 1 1 4.449 4.45l-.742.74m-4.449-4.448s.093 1.576 1.483 2.966s2.966 1.483 2.966 1.483m-4.449-4.45L7.071 10.48c-.462.462-.693.692-.891.947a5.2 5.2 0 0 0-.599.969c-.139.291-.242.601-.449 1.22l-.875 2.626m14.08-8.13L14.93 11.52m-3.41 3.41c-.462.462-.692.692-.947.891q-.451.352-.969.599c-.291.139-.601.242-1.22.448l-2.626.876m0 0l-.641.213a.848.848 0 0 1-1.073-1.073l.213-.641m1.501 1.5l-1.5-1.5">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M20.5 6h-17m5.67-2a3.001 3.001 0 0 1 5.66 0m3.544 11.4c-.177 2.654-.266 3.981-1.131 4.79s-2.195.81-4.856.81h-.774c-2.66 0-3.99 0-4.856-.81c-.865-.809-.953-2.136-1.13-4.79l-.46-6.9m13.666 0l-.2 3">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck5">
                                                                      <label class="form-check-label"
                                                                           for="customCheck5">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-5.jpg"
                                                                      class="avatar-sm rounded-circle me-2" alt="...">
                                                                 Lily W. Wilson</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV1695</a> </td>
                                                            <td><span
                                                                      class="badge bg-primary-subtle text-primary py-1 px-2">Pending</span>
                                                            </td>
                                                            <td> $9,457 </td>
                                                            <td> $3,928 </td>
                                                            <td>10 Aug, 2023</td>
                                                            <td> Mastercard</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <g fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-width="1.5">
                                                                                               <path stroke-linecap="round"
                                                                                                    d="M9 4.46A9.8 9.8 0 0 1 12 4c4.182 0 7.028 2.5 8.725 4.704C21.575 9.81 22 10.361 22 12c0 1.64-.425 2.191-1.275 3.296C19.028 17.5 16.182 20 12 20s-7.028-2.5-8.725-4.704C2.425 14.192 2 13.639 2 12c0-1.64.425-2.191 1.275-3.296A14.5 14.5 0 0 1 5 6.821">
                                                                                               </path>
                                                                                               <path
                                                                                                    d="M15 12a3 3 0 1 1-6 0a3 3 0 0 1 6 0Z">
                                                                                               </path>
                                                                                          </g>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M4 22h4m12 0h-8m1.888-18.337l.742-.742a3.146 3.146 0 1 1 4.449 4.45l-.742.74m-4.449-4.448s.093 1.576 1.483 2.966s2.966 1.483 2.966 1.483m-4.449-4.45L7.071 10.48c-.462.462-.693.692-.891.947a5.2 5.2 0 0 0-.599.969c-.139.291-.242.601-.449 1.22l-.875 2.626m14.08-8.13L14.93 11.52m-3.41 3.41c-.462.462-.692.692-.947.891q-.451.352-.969.599c-.291.139-.601.242-1.22.448l-2.626.876m0 0l-.641.213a.848.848 0 0 1-1.073-1.073l.213-.641m1.501 1.5l-1.5-1.5">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M20.5 6h-17m5.67-2a3.001 3.001 0 0 1 5.66 0m3.544 11.4c-.177 2.654-.266 3.981-1.131 4.79s-2.195.81-4.856.81h-.774c-2.66 0-3.99 0-4.856-.81c-.865-.809-.953-2.136-1.13-4.79l-.46-6.9m13.666 0l-.2 3">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck6">
                                                                      <label class="form-check-label"
                                                                           for="customCheck6">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-6.jpg"
                                                                      class="avatar-sm rounded-circle me-2" alt="...">
                                                                 Sarah M. Brooks</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV8473</a> </td>
                                                            <td> <span
                                                                      class="badge bg-danger-subtle text-danger px-2 py-1 ">Cancel</span>
                                                            </td>
                                                            <td> $4,214</td>
                                                            <td> $9,814 </td>
                                                            <td> 22 May, 2023 </td>
                                                            <td> Visa</td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <g fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-width="1.5">
                                                                                               <path stroke-linecap="round"
                                                                                                    d="M9 4.46A9.8 9.8 0 0 1 12 4c4.182 0 7.028 2.5 8.725 4.704C21.575 9.81 22 10.361 22 12c0 1.64-.425 2.191-1.275 3.296C19.028 17.5 16.182 20 12 20s-7.028-2.5-8.725-4.704C2.425 14.192 2 13.639 2 12c0-1.64.425-2.191 1.275-3.296A14.5 14.5 0 0 1 5 6.821">
                                                                                               </path>
                                                                                               <path
                                                                                                    d="M15 12a3 3 0 1 1-6 0a3 3 0 0 1 6 0Z">
                                                                                               </path>
                                                                                          </g>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M4 22h4m12 0h-8m1.888-18.337l.742-.742a3.146 3.146 0 1 1 4.449 4.45l-.742.74m-4.449-4.448s.093 1.576 1.483 2.966s2.966 1.483 2.966 1.483m-4.449-4.45L7.071 10.48c-.462.462-.693.692-.891.947a5.2 5.2 0 0 0-.599.969c-.139.291-.242.601-.449 1.22l-.875 2.626m14.08-8.13L14.93 11.52m-3.41 3.41c-.462.462-.692.692-.947.891q-.451.352-.969.599c-.291.139-.601.242-1.22.448l-2.626.876m0 0l-.641.213a.848.848 0 0 1-1.073-1.073l.213-.641m1.501 1.5l-1.5-1.5">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style><svg
                                                                                          xmlns="http://www.w3.org/2000/svg"
                                                                                          width="1em" height="1em"
                                                                                          viewBox="0 0 24 24">
                                                                                          <path fill="none"
                                                                                               stroke="currentColor"
                                                                                               stroke-linecap="round"
                                                                                               stroke-width="1.5"
                                                                                               d="M20.5 6h-17m5.67-2a3.001 3.001 0 0 1 5.66 0m3.544 11.4c-.177 2.654-.266 3.981-1.131 4.79s-2.195.81-4.856.81h-.774c-2.66 0-3.99 0-4.856-.81c-.865-.809-.953-2.136-1.13-4.79l-.46-6.9m13.666 0l-.2 3">
                                                                                          </path>
                                                                                     </svg>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck7">
                                                                      <label class="form-check-label"
                                                                           for="customCheck7">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-7.jpg"
                                                                      class="avatar-sm rounded-circle me-2" alt="...">
                                                                 Joe K. Hall</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV2150</a> </td>
                                                            <td> <span
                                                                      class="badge bg-success-subtle text-success py-1 px-2">Completed</span>
                                                            </td>
                                                            <td>$2,513</td>
                                                            <td> $5,891 </td>
                                                            <td>15 Mar, 2023</td>
                                                            <td> Paypal </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck7">
                                                                      <label class="form-check-label"
                                                                           for="customCheck7">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-8.jpg"
                                                                      class="avatar-sm rounded-circle me-2"
                                                                      alt="...">Ralph Hueber</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV5636</a> </td>
                                                            <td> <span
                                                                      class="badge bg-success-subtle text-success py-1 px-2">Completed</span>
                                                            </td>
                                                            <td>$3,103</td>
                                                            <td> $8,415 </td>
                                                            <td>15 Mar, 2023</td>
                                                            <td> Visa </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck7">
                                                                      <label class="form-check-label"
                                                                           for="customCheck7">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-9.jpg"
                                                                      class="avatar-sm rounded-circle me-2"
                                                                      alt="...">Sarah Drescher</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV2940</a> </td>
                                                            <td> <span
                                                                      class="badge bg-success-subtle text-success py-1 px-2">Completed</span>
                                                            </td>
                                                            <td>$2,416</td>
                                                            <td> $7,715 </td>
                                                            <td>15 Mar, 2023</td>
                                                            <td> Mastercard </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                       <tr>
                                                            <td>
                                                                 <div class="form-check">
                                                                      <input type="checkbox" class="form-check-input"
                                                                           id="customCheck7">
                                                                      <label class="form-check-label"
                                                                           for="customCheck7">&nbsp;</label>
                                                                 </div>
                                                            </td>
                                                            <td><img src="../webPage/admin/assets/images/users/avatar-10.jpg"
                                                                      class="avatar-sm rounded-circle me-2"
                                                                      alt="...">Leonie Meister</td>
                                                            <td><a href="javascript: void(0);"
                                                                      class="text-body">#INV9027</a> </td>
                                                            <td><span
                                                                      class="badge bg-primary-subtle text-primary py-1 px-2">Pending</span>
                                                            </td>
                                                            <td>$1,367</td>
                                                            <td> $3,651 </td>
                                                            <td>15 Mar, 2023 </td>
                                                            <td> Paypal </td>
                                                            <td>
                                                                 <div class="d-flex gap-2">
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-light btn-sm"><iconify-icon
                                                                                icon="solar:eye-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-primary btn-sm"
                                                                           data-bs-toggle="modal"
                                                                           data-bs-target="#staticBackdrop"><iconify-icon
                                                                                icon="solar:pen-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                      <a href="customer-list#!"
                                                                           class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                icon="solar:trash-bin-minimalistic-2-broken"
                                                                                class="align-middle fs-18"><template
                                                                                     shadowrootmode="open">
                                                                                     <style data-style="data-style">
                                                                                          :host {
                                                                                               display: inline-block;
                                                                                               vertical-align: 0
                                                                                          }

                                                                                          span,
                                                                                          svg {
                                                                                               display: block
                                                                                          }
                                                                                     </style>
                                                                                </template></iconify-icon></a>
                                                                 </div>
                                                            </td>
                                                       </tr>
                                                  </tbody>
                                             </table>
                                        </div>
                                        <!-- end table-responsive -->
                                   </div>
                                   <div class="card-footer border-top">
                                        <nav aria-label="Page navigation example">
                                             <ul class="pagination justify-content-end mb-0">
                                                  <li class="page-item"><a class="page-link"
                                                            href="javascript:void(0);">Previous</a></li>
                                                  <li class="page-item active"><a class="page-link"
                                                            href="javascript:void(0);">1</a></li>
                                                  <li class="page-item"><a class="page-link"
                                                            href="javascript:void(0);">2</a></li>
                                                  <li class="page-item"><a class="page-link"
                                                            href="javascript:void(0);">3</a></li>
                                                  <li class="page-item"><a class="page-link"
                                                            href="javascript:void(0);">Next</a></li>
                                             </ul>
                                        </nav>
                                   </div>
                              </div>
                         </div>

                    </div>
               </div>
               <!-- End Container Fluid -->

               <!-- ========== Footer Start ========== -->
               <footer class="footer">
                    <div class="container-fluid">
                         <div class="row">
                              <div class="col-12 text-center">
                                   <script>document.write(new Date().getFullYear())</script>2025 Â© Larkon. Crafted by
                                   <iconify-icon icon="iconamoon:heart-duotone"
                                        class="fs-18 align-middle text-danger"><template shadowrootmode="open">
                                             <style data-style="data-style">
                                                  :host {
                                                       display: inline-block;
                                                       vertical-align: 0
                                                  }

                                                  span,
                                                  svg {
                                                       display: block
                                                  }
                                             </style>
                                        </template></iconify-icon> <a href="https://1.envato.market/techzaa"
                                        class="fw-bold footer-text" target="_blank">Techzaa</a>
                              </div>
                         </div>
                    </div>
               </footer>
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



     <svg id="SvgjsSvg1001" width="2" height="0" xmlns="http://www.w3.org/2000/svg" version="1.1"
          xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev"
          style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;">
          <defs id="SvgjsDefs1002"></defs>
          <polyline id="SvgjsPolyline1003" points="0,0"></polyline>
          <path id="SvgjsPath1004" d="M0 0 "></path>
     </svg>
</body>

</html>