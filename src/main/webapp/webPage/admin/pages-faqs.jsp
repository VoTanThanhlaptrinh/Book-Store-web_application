<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
     <!-- Title Meta -->
     <meta charset="utf-8" />
     <title>FAQs | Larkon - Responsive Admin Dashboard Template</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta name="description" content="A fully responsive premium admin dashboard template" />
     <meta name="author" content="Techzaa" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge" />

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
                                        <iconify-icon icon="solar:hamburger-menu-broken" class="fs-24 align-middle"></iconify-icon>
                                   </button>
                              </div>

                              <!-- Menu Toggle Button -->
                              <div class="topbar-item">
                                   <h4 class="fw-bold topbar-button pe-none text-uppercase mb-0">FAQs</h4>
                              </div>
                         </div>

                         <div class="d-flex align-items-center gap-1">

                              <!-- Theme Color (Light/Dark) -->
                              <div class="topbar-item">
                                   <button type="button" class="topbar-button" id="light-dark-mode">
                                        <iconify-icon icon="solar:moon-bold-duotone" class="fs-24 align-middle"></iconify-icon>
                                   </button>
                              </div>

                              <!-- Notification -->
                              <div class="dropdown topbar-item">
                                   <button type="button" class="topbar-button position-relative" id="page-header-notifications-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <iconify-icon icon="solar:bell-bing-bold-duotone" class="fs-24 align-middle"></iconify-icon>
                                        <span class="position-absolute topbar-badge fs-10 translate-middle badge bg-danger rounded-pill">3<span class="visually-hidden">unread messages</span></span>
                                   </button>
                                   <div class="dropdown-menu py-0 dropdown-lg dropdown-menu-end" aria-labelledby="page-header-notifications-dropdown">
                                        <div class="p-3 border-top-0 border-start-0 border-end-0 border-dashed border">
                                             <div class="row align-items-center">
                                                  <div class="col">
                                                       <h6 class="m-0 fs-16 fw-semibold"> Notifications</h6>
                                                  </div>
                                                  <div class="col-auto">
                                                       <a href="javascript: void(0);" class="text-dark text-decoration-underline">
                                                            <small>Clear All</small>
                                                       </a>
                                                  </div>
                                             </div>
                                        </div>
                                        <div data-simplebar style="max-height: 280px;">
                                             <!-- Item -->
                                             <a href="javascript:void(0);" class="dropdown-item py-3 border-bottom text-wrap">
                                                  <div class="d-flex">
                                                       <div class="flex-shrink-0">
                                                            <img src="../webPage/admin/assets/images/users/avatar-1.jpg" class="img-fluid me-2 avatar-sm rounded-circle" alt="avatar-1" />
                                                       </div>
                                                       <div class="flex-grow-1">
                                                            <p class="mb-0"><span class="fw-medium">Josephine Thompson </span>commented on admin panel <span>" Wow ð! this admin looks good and awesome design"</span></p>
                                                       </div>
                                                  </div>
                                             </a>
                                             <!-- Item -->
                                             <a href="javascript:void(0);" class="dropdown-item py-3 border-bottom">
                                                  <div class="d-flex">
                                                       <div class="flex-shrink-0">
                                                            <div class="avatar-sm me-2">
                                                                 <span class="avatar-title bg-soft-info text-info fs-20 rounded-circle">
                                                                      D
                                                                 </span>
                                                            </div>
                                                       </div>
                                                       <div class="flex-grow-1">
                                                            <p class="mb-0 fw-semibold">Donoghue Susan</p>
                                                            <p class="mb-0 text-wrap">
                                                                 Hi, How are you? What about our next meeting
                                                            </p>
                                                       </div>
                                                  </div>
                                             </a>
                                             <!-- Item -->
                                             <a href="javascript:void(0);" class="dropdown-item py-3 border-bottom">
                                                  <div class="d-flex">
                                                       <div class="flex-shrink-0">
                                                            <img src="../webPage/admin/assets/images/users/avatar-3.jpg" class="img-fluid me-2 avatar-sm rounded-circle" alt="avatar-3" />
                                                       </div>
                                                       <div class="flex-grow-1">
                                                            <p class="mb-0 fw-semibold">Jacob Gines</p>
                                                            <p class="mb-0 text-wrap">Answered to your comment on the cash flow forecast's graph ð.</p>
                                                       </div>
                                                  </div>
                                             </a>
                                             <!-- Item -->
                                             <a href="javascript:void(0);" class="dropdown-item py-3 border-bottom">
                                                  <div class="d-flex">
                                                       <div class="flex-shrink-0">
                                                            <div class="avatar-sm me-2">
                                                                 <span class="avatar-title bg-soft-warning text-warning fs-20 rounded-circle">
                                                                      <iconify-icon icon="iconamoon:comment-dots-duotone"></iconify-icon>
                                                                 </span>
                                                            </div>
                                                       </div>
                                                       <div class="flex-grow-1">
                                                            <p class="mb-0 fw-semibold text-wrap">You have received <b>20</b> new messages in the
                                                                 conversation</p>
                                                       </div>
                                                  </div>
                                             </a>
                                             <!-- Item -->
                                             <a href="javascript:void(0);" class="dropdown-item py-3 border-bottom">
                                                  <div class="d-flex">
                                                       <div class="flex-shrink-0">
                                                            <img src="../webPage/admin/assets/images/users/avatar-5.jpg" class="img-fluid me-2 avatar-sm rounded-circle" alt="avatar-5" />
                                                       </div>
                                                       <div class="flex-grow-1">
                                                            <p class="mb-0 fw-semibold">Shawn Bunch</p>
                                                            <p class="mb-0 text-wrap">
                                                                 Commented on Admin
                                                            </p>
                                                       </div>
                                                  </div>
                                             </a>
                                        </div>
                                        <div class="text-center py-3">
                                             <a href="javascript:void(0);" class="btn btn-primary btn-sm">View All Notification <i class="bx bx-right-arrow-alt ms-1"></i></a>
                                        </div>
                                   </div>
                              </div>

                              <!-- Theme Setting -->
                              <div class="topbar-item d-none d-md-flex">
                                   <button type="button" class="topbar-button" id="theme-settings-btn" data-bs-toggle="offcanvas" data-bs-target="#theme-settings-offcanvas" aria-controls="theme-settings-offcanvas">
                                        <iconify-icon icon="solar:settings-bold-duotone" class="fs-24 align-middle"></iconify-icon>
                                   </button>
                              </div>

                              <!-- Activity -->
                              <div class="topbar-item d-none d-md-flex">
                                   <button type="button" class="topbar-button" id="theme-settings-btn" data-bs-toggle="offcanvas" data-bs-target="#theme-activity-offcanvas" aria-controls="theme-settings-offcanvas">
                                        <iconify-icon icon="solar:clock-circle-bold-duotone" class="fs-24 align-middle"></iconify-icon>
                                   </button>
                              </div>

                              <!-- User -->
                              <div class="dropdown topbar-item">
                                   <a type="button" class="topbar-button" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="d-flex align-items-center">
                                             <img class="rounded-circle" width="32" src="../webPage/admin/assets/images/users/avatar-1.jpg" alt="avatar-3">
                                        </span>
                                   </a>
                                   <div class="dropdown-menu dropdown-menu-end">
                                        <!-- item-->
                                        <h6 class="dropdown-header">Welcome Gaston!</h6>
                                        <a class="dropdown-item" href="pages-profile.html">
                                             <i class="bx bx-user-circle text-muted fs-18 align-middle me-1"></i><span class="align-middle">Profile</span>
                                        </a>
                                        <a class="dropdown-item" href="apps-chat.html">
                                             <i class="bx bx-message-dots text-muted fs-18 align-middle me-1"></i><span class="align-middle">Messages</span>
                                        </a>

                                        <a class="dropdown-item" href="pages-pricing.html">
                                             <i class="bx bx-wallet text-muted fs-18 align-middle me-1"></i><span class="align-middle">Pricing</span>
                                        </a>
                                        <a class="dropdown-item" href="pages-faqs.html">
                                             <i class="bx bx-help-circle text-muted fs-18 align-middle me-1"></i><span class="align-middle">Help</span>
                                        </a>
                                        <a class="dropdown-item" href="auth-lock-screen.html">
                                             <i class="bx bx-lock text-muted fs-18 align-middle me-1"></i><span class="align-middle">Lock screen</span>
                                        </a>

                                        <div class="dropdown-divider my-1"></div>

                                        <a class="dropdown-item text-danger" href="auth-signin.html">
                                             <i class="bx bx-log-out fs-18 align-middle me-1"></i><span class="align-middle">Logout</span>
                                        </a>
                                   </div>
                              </div>

                              <!-- App Search-->
                              <form class="app-search d-none d-md-block ms-2">
                                   <div class="position-relative">
                                        <input type="search" class="form-control" placeholder="Search..." autocomplete="off" value="">
                                        <iconify-icon icon="solar:magnifer-linear" class="search-widget-icon"></iconify-icon>
                                   </div>
                              </form>
                         </div>
                    </div>
               </div>
          </header>

          <!-- Activity Timeline -->
          <div>
               <div class="offcanvas offcanvas-end border-0" tabindex="-1" id="theme-activity-offcanvas" style="max-width: 450px; width: 100%;">
                    <div class="d-flex align-items-center bg-primary p-3 offcanvas-header">
                         <h5 class="text-white m-0 fw-semibold">Activity Stream</h5>
                         <button type="button" class="btn-close btn-close-white ms-auto" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body p-0">
                         <div data-simplebar class="h-100 p-4">
                              <div class="position-relative ms-2">
                                   <span class="position-absolute start-0  top-0 border border-dashed h-100"></span>
                                   <div class="position-relative ps-4">
                                        <div class="mb-4">
                                             <span class="position-absolute start-0 avatar-sm translate-middle-x bg-danger d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon icon="iconamoon:folder-check-duotone"></iconify-icon></span>
                                             <div class="ms-2">
                                                  <h5 class="mb-1 text-dark fw-semibold fs-15 lh-base">Report-Fix / Update </h5>
                                                  <p class="d-flex align-items-center">Add 3 files to <span class=" d-flex align-items-center text-primary ms-1"><iconify-icon icon="iconamoon:file-light"></iconify-icon> Tasks</span></p>
                                                  <div class="bg-light bg-opacity-50 rounded-2 p-2">
                                                       <div class="row">
                                                            <div class="col-lg-6 border-end border-light">
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <i class="bx bxl-figma fs-20 text-red"></i>
                                                                      <a href="#!" class="text-dark fw-medium">Concept.fig</a>
                                                                 </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                 <div class="d-flex align-items-center gap-2">
                                                                      <i class="bx bxl-file-doc fs-20 text-success"></i>
                                                                      <a href="#!" class="text-dark fw-medium">larkon.docs</a>
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
                                             <span class="position-absolute start-0 avatar-sm translate-middle-x bg-success d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon icon="iconamoon:check-circle-1-duotone"></iconify-icon></span>
                                             <div class="ms-2">
                                                  <h5 class="mb-1 text-dark fw-semibold fs-15 lh-base">Project Status
                                                  </h5>
                                                  <p class="d-flex align-items-center mb-0">Marked<span class=" d-flex align-items-center text-primary mx-1"><iconify-icon icon="iconamoon:file-light"></iconify-icon> Design </span> as <span class="badge bg-success-subtle text-success px-2 py-1 ms-1"> Completed</span></p>
                                                  <div class="d-flex align-items-center gap-3 mt-1 bg-light bg-opacity-50 p-2 rounded-2">
                                                       <a href="#!" class="fw-medium text-dark">UI/UX Figma Design</a>
                                                       <div class="ms-auto">
                                                            <a href="#!" class="fw-medium text-primary fs-18" data-bs-toggle="tooltip" data-bs-title="Download" data-bs-placement="bottom"><iconify-icon icon="iconamoon:cloud-download-duotone"></iconify-icon></a>
                                                       </div>
                                                  </div>
                                                  <h6 class="mt-3 text-muted">Monday , 3:00 PM</h6>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="position-relative ps-4">
                                        <div class="mb-4">
                                             <span class="position-absolute start-0 avatar-sm translate-middle-x bg-primary d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-16">UI</span>
                                             <div class="ms-2">
                                                  <h5 class="mb-1 text-dark fw-semibold fs-15">Larkon Application UI v2.0.0 <span class="badge bg-primary-subtle text-primary px-2 py-1 ms-1"> Latest</span>
                                                  </h5>
                                                  <p>Get access to over 20+ pages including a dashboard layout, charts, kanban board, calendar, and pre-order E-commerce & Marketing pages.</p>
                                                  <div class="mt-2">
                                                       <a href="#!" class="btn btn-light btn-sm">Download Zip</a>
                                                  </div>
                                                  <h6 class="mt-3 text-muted">Monday , 2:10 PM</h6>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="position-relative ps-4">
                                        <div class="mb-4">
                                             <span class="position-absolute start-0 translate-middle-x bg-success bg-gradient d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><img src="../webPage/admin/assets/images/users/avatar-7.jpg" alt="avatar-5" class="avatar-sm rounded-circle"></span>
                                             <div class="ms-2">
                                                  <h5 class="mb-0 text-dark fw-semibold fs-15 lh-base">Alex Smith Attached Photos
                                                  </h5>
                                                  <div class="row g-2 mt-2">
                                                       <div class="col-lg-4">
                                                            <a href="#!">
                                                                 <img src="../webPage/admin/assets/images/small/img-6.jpg" alt="" class="img-fluid rounded">
                                                            </a>
                                                       </div>
                                                       <div class="col-lg-4">
                                                            <a href="#!">
                                                                 <img src="../webPage/admin/assets/images/small/img-3.jpg" alt="" class="img-fluid rounded">
                                                            </a>
                                                       </div>
                                                       <div class="col-lg-4">
                                                            <a href="#!">
                                                                 <img src="../webPage/admin/assets/images/small/img-4.jpg" alt="" class="img-fluid rounded">
                                                            </a>
                                                       </div>
                                                  </div>
                                                  <h6 class="mt-3 text-muted">Monday 1:00 PM</h6>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="position-relative ps-4">
                                        <div class="mb-4">
                                             <span class="position-absolute start-0 translate-middle-x bg-success bg-gradient d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><img src="../webPage/admin/assets/images/users/avatar-6.jpg" alt="avatar-5" class="avatar-sm rounded-circle"></span>
                                             <div class="ms-2">
                                                  <h5 class="mb-0 text-dark fw-semibold fs-15 lh-base">Rebecca J. added a new team member
                                                  </h5>
                                                  <p class="d-flex align-items-center gap-1"><iconify-icon icon="iconamoon:check-circle-1-duotone" class="text-success"></iconify-icon> Added a new member to Front Dashboard</p>
                                                  <h6 class="mt-3 text-muted">Monday 10:00 AM</h6>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="position-relative ps-4">
                                        <div class="mb-4">
                                             <span class="position-absolute start-0 avatar-sm translate-middle-x bg-warning d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"><iconify-icon icon="iconamoon:certificate-badge-duotone"></iconify-icon></span>
                                             <div class="ms-2">
                                                  <h5 class="mb-0 text-dark fw-semibold fs-15 lh-base">Achievements
                                                  </h5>
                                                  <p class="d-flex align-items-center gap-1 mt-1">Earned a <iconify-icon icon="iconamoon:certificate-badge-duotone" class="text-danger fs-20"></iconify-icon>" Best Product Award"</p>
                                                  <h6 class="mt-3 text-muted">Monday 9:30 AM</h6>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                              <a href="#!" class="btn btn-outline-dark w-100">View All</a>
                         </div>
                    </div>
               </div>
          </div>

          <!-- Right Sidebar (Theme Settings) -->
          <div>
               <div class="offcanvas offcanvas-end border-0" tabindex="-1" id="theme-settings-offcanvas">
                    <div class="d-flex align-items-center bg-primary p-3 offcanvas-header">
                         <h5 class="text-white m-0">Theme Settings</h5>
                         <button type="button" class="btn-close btn-close-white ms-auto" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body p-0">
                         <div data-simplebar class="h-100">
                              <div class="p-3 settings-bar">

                                   <div>
                                        <h5 class="mb-3 font-16 fw-semibold">Color Scheme</h5>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-bs-theme" id="layout-color-light" value="light">
                                             <label class="form-check-label" for="layout-color-light">Light</label>
                                        </div>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-bs-theme" id="layout-color-dark" value="dark">
                                             <label class="form-check-label" for="layout-color-dark">Dark</label>
                                        </div>
                                   </div>

                                   <div>
                                        <h5 class="my-3 font-16 fw-semibold">Topbar Color</h5>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-topbar-color" id="topbar-color-light" value="light">
                                             <label class="form-check-label" for="topbar-color-light">Light</label>
                                        </div>
                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-topbar-color" id="topbar-color-dark" value="dark">
                                             <label class="form-check-label" for="topbar-color-dark">Dark</label>
                                        </div>
                                   </div>


                                   <div>
                                        <h5 class="my-3 font-16 fw-semibold">Menu Color</h5>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-color" id="leftbar-color-light" value="light">
                                             <label class="form-check-label" for="leftbar-color-light">
                                                  Light
                                             </label>
                                        </div>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-color" id="leftbar-color-dark" value="dark">
                                             <label class="form-check-label" for="leftbar-color-dark">
                                                  Dark
                                             </label>
                                        </div>
                                   </div>

                                   <div>
                                        <h5 class="my-3 font-16 fw-semibold">Sidebar Size</h5>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-size" id="leftbar-size-default" value="default">
                                             <label class="form-check-label" for="leftbar-size-default">
                                                  Default
                                             </label>
                                        </div>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-size" id="leftbar-size-small" value="condensed">
                                             <label class="form-check-label" for="leftbar-size-small">
                                                  Condensed
                                             </label>
                                        </div>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-size" id="leftbar-hidden" value="hidden">
                                             <label class="form-check-label" for="leftbar-hidden">
                                                  Hidden
                                             </label>
                                        </div>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-size" id="leftbar-size-small-hover-active" value="sm-hover-active">
                                             <label class="form-check-label" for="leftbar-size-small-hover-active">
                                                  Small Hover Active
                                             </label>
                                        </div>

                                        <div class="form-check mb-2">
                                             <input class="form-check-input" type="radio" name="data-menu-size" id="leftbar-size-small-hover" value="sm-hover">
                                             <label class="form-check-label" for="leftbar-size-small-hover">
                                                  Small Hover
                                             </label>
                                        </div>
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
                    <a href="index.html" class="logo-dark">
                         <img src="../webPage/admin/assets/images/logo-sm.png" class="logo-sm" alt="logo sm">
                         <img src="../webPage/admin/assets/images/logo-dark.png" class="logo-lg" alt="logo dark">
                    </a>

                    <a href="index.html" class="logo-light">
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
                                                       <a class="nav-link active" href="index.html">
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
                                                       <a class="nav-link menu-arrow" href="index.html#sidebarProducts"
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
                                                                           href="product-list.html">List</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-grid.html">Grid</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-details.html">Details</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-edit.html">Edit</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="product-add.html">Create</a>
                                                                 </li>
                                                            </ul>
                                                       </div>
                                                  </li>



                                                  

                                                  <li class="nav-item">
                                                       <a class="nav-link menu-arrow" href="index.html#sidebarOrders"
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
                                                                           href="orders-list.html">List</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="order-detail.html">Details</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="order-cart.html">Cart</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="order-checkout.html">Check
                                                                           Out</a>
                                                                 </li>
                                                            </ul>
                                                       </div>
                                                  </li>

                                                 

                                                
                              


                                                  <li class="menu-title mt-2">Users</li>

                                                  <li class="nav-item">
                                                       <a class="nav-link" href="pages-profile.html">
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
                                                       <a class="nav-link menu-arrow" href="index.html#sidebarRoles"
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
                                                                                href="role-list.html">List</a>
                                                                      </li>
                                                                      <li class="sub-nav-item">
                                                                           <a class="sub-nav-link"
                                                                                href="role-edit.html">Edit</a>
                                                                      </li>
                                                                      <li class="sub-nav-item">
                                                                           <a class="sub-nav-link"
                                                                                href="role-add.html">Create</a>
                                                                      </li>
                                                                 </ul>
                                                            </ul>
                                                       </div>
                                                  </li>

                                                  

                                                  <li class="nav-item">
                                                       <a class="nav-link menu-arrow" href="index.html#sidebarCustomers"
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
                                                                           href="customer-list.html">List</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="customer-detail.html">Details</a>
                                                                 </li>
                                                            </ul>
                                                       </div>
                                                  </li>

                                                 

                                                  <li class="menu-title mt-2">Other</li>

                                                  <li class="nav-item">
                                                       <a class="nav-link menu-arrow" href="index.html#sidebarCoupons"
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
                                                                           href="coupons-list.html">List</a>
                                                                 </li>
                                                                 <li class="sub-nav-item">
                                                                      <a class="sub-nav-link"
                                                                           href="coupons-add.html">Add</a>
                                                                 </li>
                                                            </ul>
                                                       </div>
                                                  </li>

                                                  <li class="nav-item">
                                                       <a class="nav-link" href="pages-review.html">
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

                    <div class="row justify-content-center">
                         <div class="col-lg-12">
                              <div class="card overflow-hidden" style="background: url('../webPage/admin/assets/images/small/img-2.jpg'); ">
                                   <div class="position-absolute top-0 end-0 bottom-0 start-0 bg-dark opacity-75"></div>
                                   <div class="card-body">
                                        <div class="row justify-content-center">
                                             <div class="col-lg-7 text-center">
                                                  <h3 class="text-white">Frequently Asked Questions</h3>
                                                  <p class="text-white-50">We're here to help with any questions you have about plans, pricing, and supported features.</p>

                                                  <div class="search-bar">
                                                       <span><i class="bx bx-search-alt"></i></span>
                                                       <input type="search" class="form-control rounded-pill bg- border-0" id="search" placeholder="Search ...">
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>
                    </div>

                    <div class="row mt-4">
                         <div class="col">
                              <div class="card">
                                   <div class="card-body p-4">
                                        <div class="row g-xl-4">
                                             <div class="col-xl-6">
                                                  
                                                  <h4 class="mb-3 fw-semibold fs-16">General</h4>
                                                  <!-- FAQs -->
                                                  <div class="accordion">
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium" type="button" data-bs-toggle="collapse" data-bs-target="#faq1" aria-expanded="true" aria-controls="faq1">
                                                                      Can I use Dummy FAQs for my website or project?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq1" class="accordion-collapse collapse show" aria-labelledby="faq1">
                                                                 <div class="accordion-body">
                                                                      Yes, you can use Dummy FAQs to populate your website or project during development or testing phases. They help simulate the appearance and functionality of a real FAQ section without requiring actual content.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2" aria-expanded="false" aria-controls="faq2">
                                                                      Are Dummy FAQs suitable for customer support purposes?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq2" class="accordion-collapse collapse" aria-labelledby="faq2">
                                                                 <div class="accordion-body">
                                                                      While Dummy FAQs can be used internally for training customer support teams, they are not suitable for public-facing customer support. Real FAQs should be based on genuine customer inquiries to provide accurate and helpful information.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3" aria-expanded="false" aria-controls="faq3">
                                                                      Do Dummy FAQs require attribution?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq3" class="accordion-collapse collapse">
                                                                 <div class="accordion-body">
                                                                      No, Dummy FAQs do not require attribution since they are not based on real questions or contributed by individuals. You can use them freely for internal testing or demonstration purposes.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>

                                                  <h4 class="mb-3 mt-4 fw-semibold fs-16">Refunds</h4>
                                                  <!-- FAQs -->
                                                  <div class="accordion">
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium" type="button" data-bs-toggle="collapse" data-bs-target="#faq4" aria-expanded="true" aria-controls="faq4">
                                                                      How do I request a refund?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq4" class="accordion-collapse collapse show" aria-labelledby="faq4">
                                                                 <div class="accordion-body">
                                                                      To request a refund, simply contact our customer support team through email or phone and provide details about your purchase and reason for the refund. Our representatives will guide you through the process.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq5" aria-expanded="false" aria-controls="faq5">
                                                                      What is the refund policy?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq5" class="accordion-collapse collapse" aria-labelledby="faq5">
                                                                 <div class="accordion-body">
                                                                      Our refund policy allows customers to request a refund within 30 days of purchase for eligible products or services. Certain restrictions may apply, so it's essential to review the terms and conditions specific to your purchase.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq6" aria-expanded="false" aria-controls="faq6">
                                                                      How long does it take to process a refund?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq6" class="accordion-collapse collapse">
                                                                 <div class="accordion-body">
                                                                      Refunds are typically processed within 3-5 business days after the request is approved. However, it may take longer depending on the payment method and financial institution involved.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>

                                             </div>

                                             <div class="col-xl-6">
                                                  
                                                  <h4 class="mb-3 fw-semibold fs-16">Payments</h4>
                                                  <!-- FAQs -->
                                                  <div class="accordion">
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium" type="button" data-bs-toggle="collapse" data-bs-target="#faq7" aria-expanded="true" aria-controls="faq7">
                                                                      Can I test my website/app with Dummy Payments?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq7" class="accordion-collapse collapse show" aria-labelledby="faq7">
                                                                 <div class="accordion-body">
                                                                      Yes, Dummy Payments are commonly used by developers and businesses to test the functionality of e-commerce platforms, mobile apps, and payment gateways. They help identify and resolve issues without risking real transactions.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq8" aria-expanded="false" aria-controls="faq8">
                                                                      Are Dummy Payments secure?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq8" class="accordion-collapse collapse" aria-labelledby="faq8">
                                                                 <div class="accordion-body">
                                                                      Dummy Payments used in controlled environments for training or demonstration purposes are generally secure. However, it's crucial not to confuse them with real transactions and avoid entering genuine financial information.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq9" aria-expanded="false" aria-controls="faq9">
                                                                      How can I differentiate between a Dummy Payment and a real one?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq9" class="accordion-collapse collapse">
                                                                 <div class="accordion-body">
                                                                      Real payments involve the transfer of actual funds, resulting in a change in financial balances. Dummy Payments, on the other hand, do not involve any monetary exchange and are typically labeled or indicated as test transactions. Always verify the authenticity of transactions before proceeding with any action.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>

                                                  <h4 class="mb-3 mt-4 fw-semibold fs-16">Support</h4>
                                                  <!-- FAQs -->
                                                  <div class="accordion">
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium" type="button" data-bs-toggle="collapse" data-bs-target="#faq10" aria-expanded="true" aria-controls="faq10">
                                                                      How do I contact customer support?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq10" class="accordion-collapse collapse show" aria-labelledby="faq10">
                                                                 <div class="accordion-body">
                                                                      You can contact our customer support team via email, phone, or live chat. Our representatives are available to assist you during business hours, Monday through Friday.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq11" aria-expanded="false" aria-controls="faq11">
                                                                      Is customer support available 24/7?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq11" class="accordion-collapse collapse" aria-labelledby="faq11">
                                                                 <div class="accordion-body">
                                                                      Our customer support is available during regular business hours, Monday through Friday. However, you can leave us a message outside of these hours, and we'll respond to you as soon as possible.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                       <div class="accordion-item">
                                                            <h2 class="accordion-header">
                                                                 <button class="accordion-button fw-medium collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq12" aria-expanded="false" aria-controls="faq12">
                                                                      How long does it take to receive a response from customer support?
                                                                 </button>
                                                            </h2>
                                                            <div id="faq12" class="accordion-collapse collapse">
                                                                 <div class="accordion-body">
                                                                      We strive to respond to all customer inquiries within 24 hours during regular business hours. Response times may vary depending on the volume of inquiries received.
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>

                                             </div>
                                        </div> <!-- end row-->

                                        <div class="row my-5">
                                             <div class="col-12 text-center">
                                                  <h4>Can't find a questions?</h4>
                                                  <button type="button" class="btn btn-success mt-2"><i class="bx bx-envelope me-1"></i> Email us your question</button>
                                                  <button type="button" class="btn btn-info mt-2 ms-1"><i class="bx bxl-twitter me-1"></i> Send us a tweet</button>
                                             </div>
                                        </div>

                                   </div> <!-- end card-body-->
                              </div> <!-- end card-->
                         </div> <!-- end col-->
                    </div>

               </div>
               <!-- End Container xxl -->

               <!-- ========== Footer Start ========== -->
               <footer class="footer">
                   <div class="container-fluid">
                       <div class="row">
                           <div class="col-12 text-center">
                               <script>document.write(new Date().getFullYear())</script> &copy; Larkon. Crafted by <iconify-icon icon="iconamoon:heart-duotone" class="fs-18 align-middle text-danger"></iconify-icon> <a
                                   href="https://1.envato.market/techzaa" class="fw-bold footer-text" target="_blank">Techzaa</a>
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

</body>

</html>