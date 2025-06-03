<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0048)https://techzaa.in/larkon/admin/coupons-add.html -->
<html lang="en" data-bs-theme="light" data-topbar-color="light" data-menu-color="dark" data-menu-size="sm-hover-active">

<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <!-- Title Meta -->

     <title>Coupons Add | Larkon - Responsive Admin Dashboard Template</title>
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
			<jsp:include page="/webPage/admin/header.jsp"></jsp:include>

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
                                                                                               <a href="https://techzaa.in/larkon/admin/coupons-add.html#!"
                                                                                                    class="text-dark fw-medium">Concept.fig</a>
                                                                                          </div>
                                                                                     </div>
                                                                                     <div class="col-lg-6">
                                                                                          <div
                                                                                               class="d-flex align-items-center gap-2">
                                                                                               <i
                                                                                                    class="bx bxl-file-doc fs-20 text-success"></i>
                                                                                               <a href="https://techzaa.in/larkon/admin/coupons-add.html#!"
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
                                                                                <a href="https://techzaa.in/larkon/admin/coupons-add.html#!"
                                                                                     class="fw-medium text-dark">UI/UX
                                                                                     Figma Design</a>
                                                                                <div class="ms-auto">
                                                                                     <a href="https://techzaa.in/larkon/admin/coupons-add.html#!"
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
                                                                                <a href="https://techzaa.in/larkon/admin/coupons-add.html#!"
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
                                                                                src="./Coupons Add _ Larkon - Responsive Admin Dashboard Template_files/avatar-7.jpg"
                                                                                alt="avatar-5"
                                                                                class="avatar-sm rounded-circle"></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-0 text-dark fw-semibold fs-15 lh-base">
                                                                                Alex Smith Attached Photos
                                                                           </h5>
                                                                           <div class="row g-2 mt-2">
                                                                                <div class="col-lg-4">
                                                                                     <a
                                                                                          href="https://techzaa.in/larkon/admin/coupons-add.html#!">
                                                                                          <img src="./Coupons Add _ Larkon - Responsive Admin Dashboard Template_files/img-6.jpg"
                                                                                               alt=""
                                                                                               class="img-fluid rounded">
                                                                                     </a>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                     <a
                                                                                          href="https://techzaa.in/larkon/admin/coupons-add.html#!">
                                                                                          <img src="./Coupons Add _ Larkon - Responsive Admin Dashboard Template_files/img-3.jpg"
                                                                                               alt=""
                                                                                               class="img-fluid rounded">
                                                                                     </a>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                     <a
                                                                                          href="https://techzaa.in/larkon/admin/coupons-add.html#!">
                                                                                          <img src="./Coupons Add _ Larkon - Responsive Admin Dashboard Template_files/img-4.jpg"
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
                                                                                src="./Coupons Add _ Larkon - Responsive Admin Dashboard Template_files/avatar-6.jpg"
                                                                                alt="avatar-5"
                                                                                class="avatar-sm rounded-circle"></span>
                                                                      <div class="ms-2">
                                                                           <h5
                                                                                class="mb-0 text-dark fw-semibold fs-15 lh-base">
                                                                                Rebecca J. added a new team member
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
                                                                                new member to Front Dashboard</p>
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
                                                       <a href="https://techzaa.in/larkon/admin/coupons-add.html#!"
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
 			<jsp:include page="/webPage/admin/main-nav.jsp"></jsp:include>
          <!-- ========== App Menu End ========== -->

          <!-- ==================================================== -->
          <!-- Start right Content here -->
          <!-- ==================================================== -->

          <div class="page-content">

               <!-- Start Container Fluid -->
               <div class="container-xxl">

                    <div class="row">
                         <div class="col-lg-5">
                              <div class="card">
                                   <div class="card-header">
                                        <h4 class="card-title">Coupon Status</h4>
                                   </div>
                                   <div class="card-body">
                                        <div class="row">
                                             <div class="col-lg-4">
                                                  <div class="d-flex gap-2 align-items-center">
                                                       <div class="form-check">
                                                            <input class="form-check-input" type="radio"
                                                                 name="flexRadioDefault5" id="flexRadioDefault9"
                                                                 checked="">
                                                            <label class="form-check-label" for="flexRadioDefault9">
                                                                 Active
                                                            </label>
                                                       </div>

                                                  </div>
                                             </div>
                                             <div class="col-lg-4">
                                                  <div class="form-check">
                                                       <input class="form-check-input" type="radio"
                                                            name="flexRadioDefault5" id="flexRadioDefault10">
                                                       <label class="form-check-label" for="flexRadioDefault10">
                                                            In Active
                                                       </label>
                                                  </div>
                                             </div>
                                             <div class="col-lg-4">
                                                  <div class="form-check">
                                                       <input class="form-check-input" type="radio"
                                                            name="flexRadioDefault5" id="flexRadioDefault11">
                                                       <label class="form-check-label" for="flexRadioDefault11">
                                                            Future Plan
                                                       </label>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                              <div class="card">
                                   <div class="card-header">
                                        <h4 class="card-title">Date Schedule</h4>
                                   </div>
                                   <div class="card-body">
                                        <form>
                                             <div class="mb-3">
                                                  <label for="start-date" class="form-label text-dark">Start
                                                       Date</label>
                                                  <input type="text" id="start-date"
                                                       class="form-control flatpickr-input active"
                                                       placeholder="dd-mm-yyyy" readonly="readonly">
                                             </div>
                                        </form>
                                        <form>
                                             <div class="mb-3">
                                                  <label for="end-date" class="form-label text-dark">End Date</label>
                                                  <input type="text" id="end-date"
                                                       class="form-control flatpickr-input active"
                                                       placeholder="dd-mm-yyyy" readonly="readonly">
                                             </div>
                                        </form>
                                   </div>
                              </div>
                         </div>

                         <div class="col-lg-7">
                              <div class="card">
                                   <div class="card-header">
                                        <h4 class="card-title">Coupon Information</h4>
                                   </div>
                                   <div class="card-body">
                                        <div class="row">
                                             <div class="col-lg-6">
                                                  <div class="mb-3">
                                                       <label for="coupons-code" class="form-label">Coupons Code</label>
                                                       <input type="text" id="coupons-code" name="coupons-code"
                                                            class="form-control" placeholder="Code enter">
                                                  </div>
                                             </div>
                                             <div class="col-lg-6">
                                                  <form>
                                                       <label for="product-categories" class="form-label">Discount
                                                            Products</label>
                                                       <div class="choices" data-type="select-one" tabindex="0"
                                                            role="combobox" aria-autocomplete="list"
                                                            aria-haspopup="true" aria-expanded="false">
                                                            <div class="choices__inner"><select
                                                                      class="form-control choices__input"
                                                                      id="product-categories" data-choices=""
                                                                      data-choices-groups=""
                                                                      data-placeholder="Select Categories"
                                                                      name="choices-single-groups" hidden=""
                                                                      tabindex="-1" data-choice="active">
                                                                      <option value=""
                                                                           data-custom-properties="[object Object]">
                                                                           Choose a categories</option>
                                                                 </select>
                                                                 <div class="choices__list choices__list--single">
                                                                      <div class="choices__item choices__placeholder choices__item--selectable"
                                                                           data-item="" data-id="1" data-value=""
                                                                           data-custom-properties="[object Object]"
                                                                           aria-selected="true">Choose a categories
                                                                      </div>
                                                                 </div>
                                                            </div>
                                                            <div class="choices__list choices__list--dropdown"
                                                                 aria-expanded="false"><input type="search"
                                                                      name="search_terms"
                                                                      class="choices__input choices__input--cloned"
                                                                      autocomplete="off" autocapitalize="off"
                                                                      spellcheck="false" role="textbox"
                                                                      aria-autocomplete="list"
                                                                      aria-label="Choose a categories" placeholder="">
                                                                 <div class="choices__list" role="listbox">
                                                                      <div id="choices--product-categories-item-choice-2"
                                                                           class="choices__item choices__item--choice is-selected choices__placeholder choices__item--selectable is-highlighted"
                                                                           role="option" data-choice="" data-id="2"
                                                                           data-value=""
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable=""
                                                                           aria-selected="true">Choose a categories
                                                                      </div>
                                                                      <div id="choices--product-categories-item-choice-1"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="option" data-choice="" data-id="1"
                                                                           data-value="Appliances"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Appliances</div>
                                                                      <div id="choices--product-categories-item-choice-3"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="option" data-choice="" data-id="3"
                                                                           data-value="Electronics"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Electronics</div>
                                                                      <div id="choices--product-categories-item-choice-4"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="option" data-choice="" data-id="4"
                                                                           data-value="Fashion"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Fashion</div>
                                                                      <div id="choices--product-categories-item-choice-5"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="option" data-choice="" data-id="5"
                                                                           data-value="Footwear"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Footwear</div>
                                                                      <div id="choices--product-categories-item-choice-6"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="option" data-choice="" data-id="6"
                                                                           data-value="Furniture"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Furniture</div>
                                                                      <div id="choices--product-categories-item-choice-7"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="option" data-choice="" data-id="7"
                                                                           data-value="Headphones"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Headphones</div>
                                                                      <div id="choices--product-categories-item-choice-8"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="option" data-choice="" data-id="8"
                                                                           data-value="Other Accessories"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Other Accessories
                                                                      </div>
                                                                      <div id="choices--product-categories-item-choice-9"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="option" data-choice="" data-id="9"
                                                                           data-value="Sportswear"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Sportswear</div>
                                                                      <div id="choices--product-categories-item-choice-10"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="option" data-choice="" data-id="10"
                                                                           data-value="Watches"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Watches</div>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </form>
                                             </div>
                                             <div class="col-lg-6">
                                                  <form>
                                                       <label for="choices-country" class="form-label">Discount
                                                            Country</label>
                                                       <div class="choices" data-type="select-one" tabindex="0"
                                                            role="combobox" aria-autocomplete="list"
                                                            aria-haspopup="true" aria-expanded="false">
                                                            <div class="choices__inner"><select
                                                                      class="form-control choices__input"
                                                                      id="choices-country" data-choices=""
                                                                      data-choices-groups=""
                                                                      data-placeholder="Select Country"
                                                                      name="choices-country" hidden="" tabindex="-1"
                                                                      data-choice="active">
                                                                      <option value=""
                                                                           data-custom-properties="[object Object]">
                                                                           Choose a country</option>
                                                                 </select>
                                                                 <div class="choices__list choices__list--single">
                                                                      <div class="choices__item choices__placeholder choices__item--selectable"
                                                                           data-item="" data-id="1" data-value=""
                                                                           data-custom-properties="[object Object]"
                                                                           aria-selected="true">Choose a country</div>
                                                                 </div>
                                                            </div>
                                                            <div class="choices__list choices__list--dropdown"
                                                                 aria-expanded="false"><input type="search"
                                                                      name="search_terms"
                                                                      class="choices__input choices__input--cloned"
                                                                      autocomplete="off" autocapitalize="off"
                                                                      spellcheck="false" role="textbox"
                                                                      aria-autocomplete="list"
                                                                      aria-label="Choose a country" placeholder="">
                                                                 <div class="choices__list" role="listbox">
                                                                      <div id="choices--choices-country-item-choice-1"
                                                                           class="choices__item choices__item--choice is-selected choices__placeholder choices__item--selectable is-highlighted"
                                                                           role="option" data-choice="" data-id="1"
                                                                           data-value=""
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable=""
                                                                           aria-selected="true">Choose a country</div>
                                                                      <div class="choices__group " role="group"
                                                                           data-group="" data-id="267807834981"
                                                                           data-value="">
                                                                           <div class="choices__heading"></div>
                                                                      </div>
                                                                      <div id="choices--choices-country-item-choice-8"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="treeitem" data-choice="" data-id="8"
                                                                           data-value="Australia"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Australia</div>
                                                                      <div id="choices--choices-country-item-choice-7"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="treeitem" data-choice="" data-id="7"
                                                                           data-value="Canada"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Canada</div>
                                                                      <div id="choices--choices-country-item-choice-6"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="treeitem" data-choice="" data-id="6"
                                                                           data-value="Denmark"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Denmark</div>
                                                                      <div id="choices--choices-country-item-choice-3"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="treeitem" data-choice="" data-id="3"
                                                                           data-value="Fran"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">France</div>
                                                                      <div id="choices--choices-country-item-choice-10"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="treeitem" data-choice="" data-id="10"
                                                                           data-value="Germany"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Germany</div>
                                                                      <div id="choices--choices-country-item-choice-9"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="treeitem" data-choice="" data-id="9"
                                                                           data-value="India"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">India</div>
                                                                      <div id="choices--choices-country-item-choice-4"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="treeitem" data-choice="" data-id="4"
                                                                           data-value="Netherlands"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Netherlands</div>
                                                                      <div id="choices--choices-country-item-choice-11"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="treeitem" data-choice="" data-id="11"
                                                                           data-value="Spain"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">Spain</div>
                                                                      <div id="choices--choices-country-item-choice-12"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="treeitem" data-choice="" data-id="12"
                                                                           data-value="United Arab Emirates"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">United Arab
                                                                           Emirates</div>
                                                                      <div id="choices--choices-country-item-choice-2"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="treeitem" data-choice="" data-id="2"
                                                                           data-value=""
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">United Kingdom
                                                                      </div>
                                                                      <div id="choices--choices-country-item-choice-5"
                                                                           class="choices__item choices__item--choice choices__item--selectable"
                                                                           role="treeitem" data-choice="" data-id="5"
                                                                           data-value="U.S.A"
                                                                           data-select-text="Press to select"
                                                                           data-choice-selectable="">U.S.A</div>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </form>
                                             </div>
                                             <div class="col-lg-6">
                                                  <div class="mb-3">
                                                       <label for="coupons-limits" class="form-label">Coupons
                                                            Limits</label>
                                                       <input type="number" id="coupons-limits" name="coupons-limits"
                                                            class="form-control" placeholder="limits nu">
                                                  </div>
                                             </div>
                                        </div>
                                        <h4 class="card-title mb-3 mt-2">Coupons Types</h4>
                                        <div class="row mb-3">
                                             <div class="col-lg-4">
                                                  <div class="d-flex gap-2 align-items-center">
                                                       <div class="form-check">
                                                            <input class="form-check-input" type="radio"
                                                                 name="flexRadioDefault6" id="flexRadioDefault12"
                                                                 checked="">
                                                            <label class="form-check-label" for="flexRadioDefault12">
                                                                 Free Shipping
                                                            </label>
                                                       </div>

                                                  </div>
                                             </div>
                                             <div class="col-lg-4">
                                                  <div class="form-check">
                                                       <input class="form-check-input" type="radio"
                                                            name="flexRadioDefault6" id="flexRadioDefault13">
                                                       <label class="form-check-label" for="flexRadioDefault13">
                                                            Percentage
                                                       </label>
                                                  </div>
                                             </div>
                                             <div class="col-lg-4">
                                                  <div class="form-check">
                                                       <input class="form-check-input" type="radio"
                                                            name="flexRadioDefault6" id="flexRadioDefault14">
                                                       <label class="form-check-label" for="flexRadioDefault14">
                                                            Fixed Amount
                                                       </label>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="row">
                                             <div class="col-lg-12">
                                                  <div class="">
                                                       <label for="discount-value" class="form-label">Discount
                                                            Value</label>
                                                       <input type="text" id="discount-value" name="discount-value"
                                                            class="form-control" placeholder="value enter">
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="card-footer border-top">
                                        <a href="https://techzaa.in/larkon/admin/coupons-add.html#!"
                                             class="btn btn-primary">Create Coupon</a>
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
                                   <script>document.write(new Date().getFullYear())</script>2025 © Larkon. Crafted by
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
                                             </style><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                                  viewBox="0 0 24 24">
                                                  <g fill="none">
                                                       <path fill="currentColor"
                                                            d="M19.071 13.142L13.414 18.8a2 2 0 0 1-2.828 0l-5.657-5.657A5 5 0 1 1 12 6.072a5 5 0 0 1 7.071 7.07"
                                                            opacity=".16"></path>
                                                       <path stroke="currentColor" stroke-linecap="round"
                                                            stroke-linejoin="round" stroke-width="2"
                                                            d="M19.071 13.142L13.414 18.8a2 2 0 0 1-2.828 0l-5.657-5.657a5 5 0 0 1 7.07-7.071a5 5 0 0 1 7.072 7.071">
                                                       </path>
                                                  </g>
                                             </svg>
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
     <script src="./Coupons Add _ Larkon - Responsive Admin Dashboard Template_files/vendor.js.download"></script>

     <!-- App Javascript (Require in all Page) -->
     <script src="./Coupons Add _ Larkon - Responsive Admin Dashboard Template_files/app.js.download"></script>
     <script src="./Coupons Add _ Larkon - Responsive Admin Dashboard Template_files/coupons-add.js.download"></script>
     <div class="flatpickr-calendar animate" tabindex="-1">
          <div class="flatpickr-months"><span class="flatpickr-prev-month"><svg version="1.1"
                         xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                         viewBox="0 0 17 17">
                         <g></g>
                         <path
                              d="M5.207 8.471l7.146 7.147-0.707 0.707-7.853-7.854 7.854-7.853 0.707 0.707-7.147 7.146z">
                         </path>
                    </svg></span>
               <div class="flatpickr-month">
                    <div class="flatpickr-current-month"><select class="flatpickr-monthDropdown-months"
                              aria-label="Month" tabindex="-1">
                              <option class="flatpickr-monthDropdown-month" value="0" tabindex="-1">January</option>
                              <option class="flatpickr-monthDropdown-month" value="1" tabindex="-1">February</option>
                              <option class="flatpickr-monthDropdown-month" value="2" tabindex="-1">March</option>
                              <option class="flatpickr-monthDropdown-month" value="3" tabindex="-1">April</option>
                              <option class="flatpickr-monthDropdown-month" value="4" tabindex="-1">May</option>
                              <option class="flatpickr-monthDropdown-month" value="5" tabindex="-1">June</option>
                              <option class="flatpickr-monthDropdown-month" value="6" tabindex="-1">July</option>
                              <option class="flatpickr-monthDropdown-month" value="7" tabindex="-1">August</option>
                              <option class="flatpickr-monthDropdown-month" value="8" tabindex="-1">September</option>
                              <option class="flatpickr-monthDropdown-month" value="9" tabindex="-1">October</option>
                              <option class="flatpickr-monthDropdown-month" value="10" tabindex="-1">November</option>
                              <option class="flatpickr-monthDropdown-month" value="11" tabindex="-1">December</option>
                         </select>
                         <div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1"
                                   aria-label="Year"><span class="arrowUp"></span><span class="arrowDown"></span></div>
                    </div>
               </div><span class="flatpickr-next-month"><svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 17 17">
                         <g></g>
                         <path
                              d="M13.207 8.472l-7.854 7.854-0.707-0.707 7.146-7.146-7.146-7.148 0.707-0.707 7.854 7.854z">
                         </path>
                    </svg></span>
          </div>
          <div class="flatpickr-innerContainer">
               <div class="flatpickr-rContainer">
                    <div class="flatpickr-weekdays">
                         <div class="flatpickr-weekdaycontainer">
                              <span class="flatpickr-weekday">
                                   Sun</span><span class="flatpickr-weekday">Mon</span><span
                                   class="flatpickr-weekday">Tue</span><span class="flatpickr-weekday">Wed</span><span
                                   class="flatpickr-weekday">Thu</span><span class="flatpickr-weekday">Fri</span><span
                                   class="flatpickr-weekday">Sat
                              </span>
                         </div>
                    </div>
                    <div class="flatpickr-days" tabindex="-1">
                         <div class="dayContainer"><span class="flatpickr-day prevMonthDay" aria-label="March 30, 2025"
                                   tabindex="-1">30</span><span class="flatpickr-day prevMonthDay"
                                   aria-label="March 31, 2025" tabindex="-1">31</span><span class="flatpickr-day"
                                   aria-label="April 1, 2025" tabindex="-1">1</span><span class="flatpickr-day"
                                   aria-label="April 2, 2025" tabindex="-1">2</span><span class="flatpickr-day"
                                   aria-label="April 3, 2025" tabindex="-1">3</span><span class="flatpickr-day"
                                   aria-label="April 4, 2025" tabindex="-1">4</span><span class="flatpickr-day"
                                   aria-label="April 5, 2025" tabindex="-1">5</span><span class="flatpickr-day"
                                   aria-label="April 6, 2025" tabindex="-1">6</span><span class="flatpickr-day"
                                   aria-label="April 7, 2025" tabindex="-1">7</span><span class="flatpickr-day"
                                   aria-label="April 8, 2025" tabindex="-1">8</span><span class="flatpickr-day"
                                   aria-label="April 9, 2025" tabindex="-1">9</span><span class="flatpickr-day"
                                   aria-label="April 10, 2025" tabindex="-1">10</span><span class="flatpickr-day"
                                   aria-label="April 11, 2025" tabindex="-1">11</span><span class="flatpickr-day today"
                                   aria-label="April 12, 2025" aria-current="date" tabindex="-1">12</span><span
                                   class="flatpickr-day" aria-label="April 13, 2025" tabindex="-1">13</span><span
                                   class="flatpickr-day" aria-label="April 14, 2025" tabindex="-1">14</span><span
                                   class="flatpickr-day" aria-label="April 15, 2025" tabindex="-1">15</span><span
                                   class="flatpickr-day" aria-label="April 16, 2025" tabindex="-1">16</span><span
                                   class="flatpickr-day" aria-label="April 17, 2025" tabindex="-1">17</span><span
                                   class="flatpickr-day" aria-label="April 18, 2025" tabindex="-1">18</span><span
                                   class="flatpickr-day" aria-label="April 19, 2025" tabindex="-1">19</span><span
                                   class="flatpickr-day" aria-label="April 20, 2025" tabindex="-1">20</span><span
                                   class="flatpickr-day" aria-label="April 21, 2025" tabindex="-1">21</span><span
                                   class="flatpickr-day" aria-label="April 22, 2025" tabindex="-1">22</span><span
                                   class="flatpickr-day" aria-label="April 23, 2025" tabindex="-1">23</span><span
                                   class="flatpickr-day" aria-label="April 24, 2025" tabindex="-1">24</span><span
                                   class="flatpickr-day" aria-label="April 25, 2025" tabindex="-1">25</span><span
                                   class="flatpickr-day" aria-label="April 26, 2025" tabindex="-1">26</span><span
                                   class="flatpickr-day" aria-label="April 27, 2025" tabindex="-1">27</span><span
                                   class="flatpickr-day" aria-label="April 28, 2025" tabindex="-1">28</span><span
                                   class="flatpickr-day" aria-label="April 29, 2025" tabindex="-1">29</span><span
                                   class="flatpickr-day" aria-label="April 30, 2025" tabindex="-1">30</span><span
                                   class="flatpickr-day nextMonthDay" aria-label="May 1, 2025"
                                   tabindex="-1">1</span><span class="flatpickr-day nextMonthDay"
                                   aria-label="May 2, 2025" tabindex="-1">2</span><span
                                   class="flatpickr-day nextMonthDay" aria-label="May 3, 2025"
                                   tabindex="-1">3</span><span class="flatpickr-day nextMonthDay"
                                   aria-label="May 4, 2025" tabindex="-1">4</span><span
                                   class="flatpickr-day nextMonthDay" aria-label="May 5, 2025"
                                   tabindex="-1">5</span><span class="flatpickr-day nextMonthDay"
                                   aria-label="May 6, 2025" tabindex="-1">6</span><span
                                   class="flatpickr-day nextMonthDay" aria-label="May 7, 2025"
                                   tabindex="-1">7</span><span class="flatpickr-day nextMonthDay"
                                   aria-label="May 8, 2025" tabindex="-1">8</span><span
                                   class="flatpickr-day nextMonthDay" aria-label="May 9, 2025"
                                   tabindex="-1">9</span><span class="flatpickr-day nextMonthDay"
                                   aria-label="May 10, 2025" tabindex="-1">10</span></div>
                    </div>
               </div>
          </div>
     </div>
     <div class="flatpickr-calendar animate" tabindex="-1">
          <div class="flatpickr-months"><span class="flatpickr-prev-month"><svg version="1.1"
                         xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                         viewBox="0 0 17 17">
                         <g></g>
                         <path
                              d="M5.207 8.471l7.146 7.147-0.707 0.707-7.853-7.854 7.854-7.853 0.707 0.707-7.147 7.146z">
                         </path>
                    </svg></span>
               <div class="flatpickr-month">
                    <div class="flatpickr-current-month"><select class="flatpickr-monthDropdown-months"
                              aria-label="Month" tabindex="-1">
                              <option class="flatpickr-monthDropdown-month" value="0" tabindex="-1">January</option>
                              <option class="flatpickr-monthDropdown-month" value="1" tabindex="-1">February</option>
                              <option class="flatpickr-monthDropdown-month" value="2" tabindex="-1">March</option>
                              <option class="flatpickr-monthDropdown-month" value="3" tabindex="-1">April</option>
                              <option class="flatpickr-monthDropdown-month" value="4" tabindex="-1">May</option>
                              <option class="flatpickr-monthDropdown-month" value="5" tabindex="-1">June</option>
                              <option class="flatpickr-monthDropdown-month" value="6" tabindex="-1">July</option>
                              <option class="flatpickr-monthDropdown-month" value="7" tabindex="-1">August</option>
                              <option class="flatpickr-monthDropdown-month" value="8" tabindex="-1">September</option>
                              <option class="flatpickr-monthDropdown-month" value="9" tabindex="-1">October</option>
                              <option class="flatpickr-monthDropdown-month" value="10" tabindex="-1">November</option>
                              <option class="flatpickr-monthDropdown-month" value="11" tabindex="-1">December</option>
                         </select>
                         <div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1"
                                   aria-label="Year"><span class="arrowUp"></span><span class="arrowDown"></span></div>
                    </div>
               </div><span class="flatpickr-next-month"><svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 17 17">
                         <g></g>
                         <path
                              d="M13.207 8.472l-7.854 7.854-0.707-0.707 7.146-7.146-7.146-7.148 0.707-0.707 7.854 7.854z">
                         </path>
                    </svg></span>
          </div>
          <div class="flatpickr-innerContainer">
               <div class="flatpickr-rContainer">
                    <div class="flatpickr-weekdays">
                         <div class="flatpickr-weekdaycontainer">
                              <span class="flatpickr-weekday">
                                   Sun</span><span class="flatpickr-weekday">Mon</span><span
                                   class="flatpickr-weekday">Tue</span><span class="flatpickr-weekday">Wed</span><span
                                   class="flatpickr-weekday">Thu</span><span class="flatpickr-weekday">Fri</span><span
                                   class="flatpickr-weekday">Sat
                              </span>
                         </div>
                    </div>
                    <div class="flatpickr-days" tabindex="-1">
                         <div class="dayContainer"><span class="flatpickr-day prevMonthDay" aria-label="March 30, 2025"
                                   tabindex="-1">30</span><span class="flatpickr-day prevMonthDay"
                                   aria-label="March 31, 2025" tabindex="-1">31</span><span class="flatpickr-day"
                                   aria-label="April 1, 2025" tabindex="-1">1</span><span class="flatpickr-day"
                                   aria-label="April 2, 2025" tabindex="-1">2</span><span class="flatpickr-day"
                                   aria-label="April 3, 2025" tabindex="-1">3</span><span class="flatpickr-day"
                                   aria-label="April 4, 2025" tabindex="-1">4</span><span class="flatpickr-day"
                                   aria-label="April 5, 2025" tabindex="-1">5</span><span class="flatpickr-day"
                                   aria-label="April 6, 2025" tabindex="-1">6</span><span class="flatpickr-day"
                                   aria-label="April 7, 2025" tabindex="-1">7</span><span class="flatpickr-day"
                                   aria-label="April 8, 2025" tabindex="-1">8</span><span class="flatpickr-day"
                                   aria-label="April 9, 2025" tabindex="-1">9</span><span class="flatpickr-day"
                                   aria-label="April 10, 2025" tabindex="-1">10</span><span class="flatpickr-day"
                                   aria-label="April 11, 2025" tabindex="-1">11</span><span class="flatpickr-day today"
                                   aria-label="April 12, 2025" aria-current="date" tabindex="-1">12</span><span
                                   class="flatpickr-day" aria-label="April 13, 2025" tabindex="-1">13</span><span
                                   class="flatpickr-day" aria-label="April 14, 2025" tabindex="-1">14</span><span
                                   class="flatpickr-day" aria-label="April 15, 2025" tabindex="-1">15</span><span
                                   class="flatpickr-day" aria-label="April 16, 2025" tabindex="-1">16</span><span
                                   class="flatpickr-day" aria-label="April 17, 2025" tabindex="-1">17</span><span
                                   class="flatpickr-day" aria-label="April 18, 2025" tabindex="-1">18</span><span
                                   class="flatpickr-day" aria-label="April 19, 2025" tabindex="-1">19</span><span
                                   class="flatpickr-day" aria-label="April 20, 2025" tabindex="-1">20</span><span
                                   class="flatpickr-day" aria-label="April 21, 2025" tabindex="-1">21</span><span
                                   class="flatpickr-day" aria-label="April 22, 2025" tabindex="-1">22</span><span
                                   class="flatpickr-day" aria-label="April 23, 2025" tabindex="-1">23</span><span
                                   class="flatpickr-day" aria-label="April 24, 2025" tabindex="-1">24</span><span
                                   class="flatpickr-day" aria-label="April 25, 2025" tabindex="-1">25</span><span
                                   class="flatpickr-day" aria-label="April 26, 2025" tabindex="-1">26</span><span
                                   class="flatpickr-day" aria-label="April 27, 2025" tabindex="-1">27</span><span
                                   class="flatpickr-day" aria-label="April 28, 2025" tabindex="-1">28</span><span
                                   class="flatpickr-day" aria-label="April 29, 2025" tabindex="-1">29</span><span
                                   class="flatpickr-day" aria-label="April 30, 2025" tabindex="-1">30</span><span
                                   class="flatpickr-day nextMonthDay" aria-label="May 1, 2025"
                                   tabindex="-1">1</span><span class="flatpickr-day nextMonthDay"
                                   aria-label="May 2, 2025" tabindex="-1">2</span><span
                                   class="flatpickr-day nextMonthDay" aria-label="May 3, 2025"
                                   tabindex="-1">3</span><span class="flatpickr-day nextMonthDay"
                                   aria-label="May 4, 2025" tabindex="-1">4</span><span
                                   class="flatpickr-day nextMonthDay" aria-label="May 5, 2025"
                                   tabindex="-1">5</span><span class="flatpickr-day nextMonthDay"
                                   aria-label="May 6, 2025" tabindex="-1">6</span><span
                                   class="flatpickr-day nextMonthDay" aria-label="May 7, 2025"
                                   tabindex="-1">7</span><span class="flatpickr-day nextMonthDay"
                                   aria-label="May 8, 2025" tabindex="-1">8</span><span
                                   class="flatpickr-day nextMonthDay" aria-label="May 9, 2025"
                                   tabindex="-1">9</span><span class="flatpickr-day nextMonthDay"
                                   aria-label="May 10, 2025" tabindex="-1">10</span></div>
                    </div>
               </div>
          </div>
          
     </div>
	<jsp:include page="/webPage/admin/footer.jsp"></jsp:include>


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