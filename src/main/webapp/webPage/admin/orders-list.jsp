<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/webPage/lib/tag.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0048)orders-list -->
<html lang="en" data-bs-theme="light" data-topbar-color="light" data-menu-color="dark" data-menu-size="sm-hover-active">

<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <!-- Title Meta -->

     <title>Orders List | Larkon - Responsive Admin Dashboard Template</title>
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
                                                                                               <a href="orders-list#!"
                                                                                                    class="text-dark fw-medium">Concept.fig</a>
                                                                                          </div>
                                                                                     </div>
                                                                                     <div class="col-lg-6">
                                                                                          <div
                                                                                               class="d-flex align-items-center gap-2">
                                                                                               <i
                                                                                                    class="bx bxl-file-doc fs-20 text-success"></i>
                                                                                               <a href="orders-list#!"
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
                                                                                <a href="orders-list#!"
                                                                                     class="fw-medium text-dark">UI/UX
                                                                                     Figma Design</a>
                                                                                <div class="ms-auto">
                                                                                     <a href="orders-list#!"
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
                                                                                <a href="orders-list#!"
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
                                                                                Alex Smith Attached Photos
                                                                           </h5>
                                                                           <div class="row g-2 mt-2">
                                                                                <div class="col-lg-4">
                                                                                     <a
                                                                                          href="orders-list#!">
                                                                                          <img src="../webPage/admin/assets/images/small/img-6.jpg"
                                                                                               alt=""
                                                                                               class="img-fluid rounded">
                                                                                     </a>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                     <a
                                                                                          href="orders-list#!">
                                                                                          <img src="../webPage/admin/assets/images/small/img-3.jpg"
                                                                                               alt=""
                                                                                               class="img-fluid rounded">
                                                                                     </a>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                     <a
                                                                                          href="orders-list#!">
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
                                                                                new member to Front Dashboard
                                                                           </p>
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
                                                       <a href="orders-list#!"
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
          <div>

               <div class="page-content">

                    <!-- Start Container Fluid -->
                    <div class="container-xxl">

                         <div class="row">
                              <div class="col-md-6 col-xl-3">
                                   <div class="card">
                                        <div class="card-body">
                                             <div class="d-flex align-items-center justify-content-between">
                                                  <div>
                                                       <h4 class="card-title mb-2">Payment Refund</h4>
                                                       <p class="text-muted fw-medium fs-22 mb-0">490</p>
                                                  </div>
                                                  <div>
                                                       <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                            <iconify-icon icon="solar:chat-round-money-broken"
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
                                                                      </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                           width="1em" height="1em" viewBox="0 0 24 24">
                                                                           <g fill="none" stroke="currentColor"
                                                                                stroke-linecap="round"
                                                                                stroke-width="1.5">
                                                                                <path
                                                                                     d="M12 15.333c1.105 0 2-.746 2-1.666S13.105 12 12 12s-2-.746-2-1.667c0-.92.895-1.666 2-1.666m0 6.666c-1.105 0-2-.746-2-1.666m2 1.666V16m0-8v.667m0 0c1.105 0 2 .746 2 1.666">
                                                                                </path>
                                                                                <path
                                                                                     d="M17 3.338A9.95 9.95 0 0 0 12 2C6.477 2 2 6.477 2 12c0 1.6.376 3.112 1.043 4.453c.178.356.237.763.134 1.148l-.595 2.226a1.3 1.3 0 0 0 1.591 1.592l2.226-.596a1.63 1.63 0 0 1 1.149.133A9.96 9.96 0 0 0 12 22c5.523 0 10-4.477 10-10c0-1.821-.487-3.53-1.338-5">
                                                                                </path>
                                                                           </g>
                                                                      </svg>
                                                                 </template></iconify-icon>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                              <div class="col-md-6 col-xl-3">
                                   <div class="card">
                                        <div class="card-body">
                                             <div class="d-flex align-items-center justify-content-between">
                                                  <div>
                                                       <h4 class="card-title mb-2">Order Cancel</h4>
                                                       <p class="text-muted fw-medium fs-22 mb-0">241</p>
                                                  </div>
                                                  <div>
                                                       <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                            <iconify-icon icon="solar:cart-cross-broken"
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
                                                                      </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                           width="1em" height="1em" viewBox="0 0 24 24">
                                                                           <g fill="none" stroke="currentColor"
                                                                                stroke-width="1.5">
                                                                                <path
                                                                                     d="M7.5 18a1.5 1.5 0 1 1 0 3a1.5 1.5 0 0 1 0-3Zm9 0a1.5 1.5 0 1 1 0 3a1.5 1.5 0 0 1 0-3Z">
                                                                                </path>
                                                                                <path stroke-linecap="round"
                                                                                     d="m11.5 12.5l3-3m0 3l-3-3M2 3l.261.092c1.302.457 1.953.686 2.325 1.231s.372 1.268.372 2.715V9.76c0 2.942.063 3.912.93 4.826c.866.914 2.26.914 5.05.914H12m4.24 0c1.561 0 2.342 0 2.894-.45c.551-.45.709-1.214 1.024-2.743l.5-2.424c.347-1.74.52-2.609.076-3.186c-.443-.577-1.96-.577-3.645-.577h-6.065m-6.066 0H7">
                                                                                </path>
                                                                           </g>
                                                                      </svg>
                                                                 </template></iconify-icon>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>

                              <div class="col-md-6 col-xl-3">
                                   <div class="card">
                                        <div class="card-body">
                                             <div class="d-flex align-items-center justify-content-between">
                                                  <div>
                                                       <h4 class="card-title mb-2">Order Shipped</h4>
                                                       <p class="text-muted fw-medium fs-22 mb-0">630</p>
                                                  </div>
                                                  <div>
                                                       <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                            <iconify-icon icon="solar:box-broken"
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
                                                                      </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                           width="1em" height="1em" viewBox="0 0 24 24">
                                                                           <path fill="none" stroke="currentColor"
                                                                                stroke-linecap="round"
                                                                                stroke-width="1.5"
                                                                                d="M21.984 10c-.037-1.311-.161-2.147-.581-2.86c-.598-1.015-1.674-1.58-3.825-2.708l-2-1.05C13.822 2.461 12.944 2 12 2s-1.822.46-3.578 1.382l-2 1.05C4.271 5.56 3.195 6.125 2.597 7.14C2 8.154 2 9.417 2 11.942v.117c0 2.524 0 3.787.597 4.801c.598 1.015 1.674 1.58 3.825 2.709l2 1.049C10.178 21.539 11.056 22 12 22s1.822-.46 3.578-1.382l2-1.05c2.151-1.129 3.227-1.693 3.825-2.708c.42-.713.544-1.549.581-2.86M21 7.5l-4 2M12 12L3 7.5m9 4.5v9.5m0-9.5l4.5-2.25l.5-.25m0 0V13m0-3.5l-9.5-5">
                                                                           </path>
                                                                      </svg>
                                                                 </template></iconify-icon>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>

                              <div class="col-md-6 col-xl-3">
                                   <div class="card">
                                        <div class="card-body">
                                             <div class="d-flex align-items-center justify-content-between">
                                                  <div>
                                                       <h4 class="card-title mb-2">Order Delivering</h4>
                                                       <p class="text-muted fw-medium fs-22 mb-0">170</p>
                                                  </div>
                                                  <div>
                                                       <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                            <iconify-icon icon="solar:tram-broken"
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
                                                                      </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                           width="1em" height="1em" viewBox="0 0 24 24">
                                                                           <g fill="none" stroke="currentColor"
                                                                                stroke-linecap="round"
                                                                                stroke-width="1.5">
                                                                                <path
                                                                                     d="M20 10v2c0 3.771 0 5.657-1.172 6.828S15.771 20 12 20s-5.657 0-6.828-1.172S4 15.771 4 12v-2c0-3.771 0-5.657 1.172-6.828S8.229 2 12 2s5.657 0 6.828 1.172c.654.653.943 1.528 1.07 2.828">
                                                                                </path>
                                                                                <path stroke-linejoin="round"
                                                                                     d="M15.5 16H17M7 16h1.5M7 20l-1 2m11-2l1 2M10 2v.5a2 2 0 1 0 4 0V2m6 11h-4M4 13h8">
                                                                                </path>
                                                                           </g>
                                                                      </svg>
                                                                 </template></iconify-icon>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>

                              <div class="col-md-6 col-xl-3">
                                   <div class="card">
                                        <div class="card-body">
                                             <div class="d-flex align-items-center justify-content-between">
                                                  <div>
                                                       <h4 class="card-title mb-2">Pending Review</h4>
                                                       <p class="text-muted fw-medium fs-22 mb-0">210</p>
                                                  </div>
                                                  <div>
                                                       <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                            <iconify-icon icon="solar:clipboard-remove-broken"
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
                                                                      </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                           width="1em" height="1em" viewBox="0 0 24 24">
                                                                           <g fill="none" stroke="currentColor"
                                                                                stroke-width="1.5">
                                                                                <path
                                                                                     d="M8 3.5A1.5 1.5 0 0 1 9.5 2h5A1.5 1.5 0 0 1 16 3.5v1A1.5 1.5 0 0 1 14.5 6h-5A1.5 1.5 0 0 1 8 4.5z">
                                                                                </path>
                                                                                <path stroke-linecap="round"
                                                                                     d="m14.5 11l-5 5m0-5l5 5m6.5 0c0 2.829 0 4.243-.879 5.122C19.243 22 17.828 22 15 22H9c-2.828 0-4.243 0-5.121-.878C3 20.242 3 18.829 3 16v-3m13-8.998c2.175.012 3.353.109 4.121.877C21 5.758 21 7.172 21 10v2M8 4.002c-2.175.012-3.353.109-4.121.877S3.014 6.825 3.002 9">
                                                                                </path>
                                                                           </g>
                                                                      </svg>
                                                                 </template></iconify-icon>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                              <div class="col-md-6 col-xl-3">
                                   <div class="card">
                                        <div class="card-body">
                                             <div class="d-flex align-items-center justify-content-between">
                                                  <div>
                                                       <h4 class="card-title mb-2">Pending Payment</h4>
                                                       <p class="text-muted fw-medium fs-22 mb-0">608</p>
                                                  </div>
                                                  <div>
                                                       <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                            <iconify-icon icon="solar:clock-circle-broken"
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
                                                                      </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                           width="1em" height="1em" viewBox="0 0 24 24">
                                                                           <g fill="none" stroke="currentColor"
                                                                                stroke-linecap="round"
                                                                                stroke-width="1.5">
                                                                                <path stroke-linejoin="round"
                                                                                     d="M12 8v4l2.5 2.5"></path>
                                                                                <path
                                                                                     d="M7 3.338A9.95 9.95 0 0 1 12 2c5.523 0 10 4.477 10 10s-4.477 10-10 10S2 17.523 2 12c0-1.821.487-3.53 1.338-5">
                                                                                </path>
                                                                           </g>
                                                                      </svg>
                                                                 </template></iconify-icon>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                              <div class="col-md-6 col-xl-3">
                                   <div class="card">
                                        <div class="card-body">
                                             <div class="d-flex align-items-center justify-content-between">
                                                  <div>
                                                       <h4 class="card-title mb-2">Delivered</h4>
                                                       <p class="text-muted fw-medium fs-22 mb-0">200</p>
                                                  </div>
                                                  <div>
                                                       <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                            <iconify-icon icon="solar:clipboard-check-broken"
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
                                                                      </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                           width="1em" height="1em" viewBox="0 0 24 24">
                                                                           <g fill="none" stroke="currentColor"
                                                                                stroke-width="1.5">
                                                                                <path stroke-linecap="round"
                                                                                     stroke-linejoin="round"
                                                                                     d="m9 13.4l1.714 1.6L15 11"></path>
                                                                                <path stroke-linecap="round"
                                                                                     d="M21 16c0 2.829 0 4.243-.879 5.122C19.243 22 17.828 22 15 22H9c-2.828 0-4.243 0-5.121-.878C3 20.242 3 18.829 3 16v-3m13-8.998c2.175.012 3.353.109 4.121.877C21 5.758 21 7.172 21 10v2M8 4.002c-2.175.012-3.353.109-4.121.877S3.014 6.825 3.002 9">
                                                                                </path>
                                                                                <path
                                                                                     d="M8 3.5A1.5 1.5 0 0 1 9.5 2h5A1.5 1.5 0 0 1 16 3.5v1A1.5 1.5 0 0 1 14.5 6h-5A1.5 1.5 0 0 1 8 4.5z">
                                                                                </path>
                                                                           </g>
                                                                      </svg>
                                                                 </template></iconify-icon>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                              <div class="col-md-6 col-xl-3">
                                   <div class="card">
                                        <div class="card-body">
                                             <div class="d-flex align-items-center justify-content-between">
                                                  <div>
                                                       <h4 class="card-title mb-2">In Progress</h4>
                                                       <p class="text-muted fw-medium fs-22 mb-0">656</p>
                                                  </div>
                                                  <div>
                                                       <div class="avatar-md bg-primary bg-opacity-10 rounded">
                                                            <iconify-icon icon="solar:inbox-line-broken"
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
                                                                      </style><svg xmlns="http://www.w3.org/2000/svg"
                                                                           width="1em" height="1em" viewBox="0 0 24 24">
                                                                           <g fill="none" stroke="currentColor"
                                                                                stroke-linecap="round"
                                                                                stroke-width="1.5">
                                                                                <path
                                                                                     d="M2 13h3.16c.905 0 1.358 0 1.756.183s.692.527 1.281 1.214l.606.706c.589.687.883 1.031 1.281 1.214s.85.183 1.756.183h.32c.905 0 1.358 0 1.756-.183s.692-.527 1.281-1.214l.606-.706c.589-.687.883-1.031 1.281-1.214S17.934 13 18.84 13H22M8 7h8m-6 3.5h4">
                                                                                </path>
                                                                                <path
                                                                                     d="M22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12s0-7.071 1.464-8.536C4.93 2 7.286 2 12 2s7.071 0 8.535 1.464c.974.974 1.3 2.343 1.41 4.536">
                                                                                </path>
                                                                           </g>
                                                                      </svg>
                                                                 </template></iconify-icon>
                                                       </div>
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
                                                  <h4 class="card-title">All Order List</h4>
                                             </div>
                                             <div class="dropdown">
                                                  <a href="orders-list#"
                                                       class="dropdown-toggle btn btn-sm btn-outline-light rounded"
                                                       data-bs-toggle="dropdown" aria-expanded="false">
                                                       This Month
                                                  </a>
                                                  <div class="dropdown-menu dropdown-menu-end">
                                                       <!-- item-->
                                                       <a href="orders-list#!"
                                                            class="dropdown-item">Download</a>
                                                       <!-- item-->
                                                       <a href="orders-list#!"
                                                            class="dropdown-item">Export</a>
                                                       <!-- item-->
                                                       <a href="orders-list#!"
                                                            class="dropdown-item">Import</a>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="card-body p-0">
                                             <div class="table-responsive">
                                                  <table class="table align-middle mb-0 table-hover table-centered">
                                                       <thead class="bg-light-subtle">
                                                            <tr>
                                                                 <th>Order ID</th>
                                                                 <th>Created at</th>
                                                                 <th>Customer</th>
                                                                 <th>Priority</th>
                                                                 <th>Total</th>
                                                                 <th>Payment Status</th>
                                                                 <th>Items</th>
                                                                 <th>Delivery Number</th>
                                                                 <th>Order Status</th>
                                                                 <th>Action</th>
                                                            </tr>
                                                       </thead>
                                                       <tbody>
                                                            <tr>
                                                                 <td>
                                                                      #583488/80
                                                                 </td>
                                                                 <td>Apr 23 , 2024</td>
                                                                 <td>
                                                                      <a href="orders-list#!"
                                                                           class="link-primary fw-medium">Gail C.
                                                                           Anderson</a>
                                                                 </td>
                                                                 <td> Normal</td>
                                                                 <td> $1,230.00</td>
                                                                 <td> <span
                                                                           class="badge bg-light text-dark  px-2 py-1 fs-13">Unpaid</span>
                                                                 </td>
                                                                 <td> 4</td>
                                                                 <td> -</td>
                                                                 <td> <span
                                                                           class="badge border border-secondary text-secondary  px-2 py-1 fs-13">Draft</span>
                                                                 </td>
                                                                 <td>
                                                                      <div class="d-flex gap-2">
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-light btn-sm"><iconify-icon
                                                                                     icon="solar:eye-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-primary btn-sm"><iconify-icon
                                                                                     icon="solar:pen-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                     icon="solar:trash-bin-minimalistic-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                      #456754/80
                                                                 </td>
                                                                 <td>Apr 20 , 2024</td>
                                                                 <td>
                                                                      <a href="orders-list#!"
                                                                           class="link-primary fw-medium">Jung S.
                                                                           Ayala</a>
                                                                 </td>
                                                                 <td> Normal</td>
                                                                 <td> $987.00</td>
                                                                 <td> <span
                                                                           class="badge bg-success text-light  px-2 py-1 fs-13">Paid</span>
                                                                 </td>
                                                                 <td> 2</td>
                                                                 <td> -</td>
                                                                 <td> <span
                                                                           class="badge border border-warning text-warning  px-2 py-1 fs-13">Packaging</span>
                                                                 </td>
                                                                 <td>
                                                                      <div class="d-flex gap-2">
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-light btn-sm"><iconify-icon
                                                                                     icon="solar:eye-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-primary btn-sm"><iconify-icon
                                                                                     icon="solar:pen-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                     icon="solar:trash-bin-minimalistic-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                      #578246/80
                                                                 </td>
                                                                 <td>Apr 19 , 2024</td>
                                                                 <td>
                                                                      <a href="orders-list#!"
                                                                           class="link-primary fw-medium">David A.
                                                                           Arnold</a>
                                                                 </td>
                                                                 <td> High</td>
                                                                 <td> $1,478.00</td>
                                                                 <td> <span
                                                                           class="badge  bg-success text-light px-2 py-1 fs-13">Paid</span>
                                                                 </td>
                                                                 <td> 5</td>
                                                                 <td> #D-57837678</td>
                                                                 <td> <span
                                                                           class="badge border border-success text-success  px-2 py-1 fs-13">Completed</span>
                                                                 </td>
                                                                 <td>
                                                                      <div class="d-flex gap-2">
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-light btn-sm"><iconify-icon
                                                                                     icon="solar:eye-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-primary btn-sm"><iconify-icon
                                                                                     icon="solar:pen-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                     icon="solar:trash-bin-minimalistic-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                      #348930/80
                                                                 </td>
                                                                 <td>Apr 04 , 2024</td>
                                                                 <td>
                                                                      <a href="orders-list#!"
                                                                           class="link-primary fw-medium">Cecile D.
                                                                           Gordon</a>
                                                                 </td>
                                                                 <td> Normal</td>
                                                                 <td> $720.00</td>
                                                                 <td> <span
                                                                           class="badge bg-light text-dark  px-2 py-1 fs-13">Refund</span>
                                                                 </td>
                                                                 <td> 4</td>
                                                                 <td> -</td>
                                                                 <td> <span
                                                                           class="badge border border-danger text-danger  px-2 py-1 fs-13">Canceled</span>
                                                                 </td>
                                                                 <td>
                                                                      <div class="d-flex gap-2">
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-light btn-sm"><iconify-icon
                                                                                     icon="solar:eye-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-primary btn-sm"><iconify-icon
                                                                                     icon="solar:pen-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                     icon="solar:trash-bin-minimalistic-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                 </td>
                                                            </tr>


                                                            <tr>
                                                                 <td>
                                                                      #391367/80
                                                                 </td>
                                                                 <td>Apr 02 , 2024</td>
                                                                 <td>
                                                                      <a href="orders-list#!"
                                                                           class="link-primary fw-medium">William
                                                                           Moreno</a>
                                                                 </td>
                                                                 <td> Normal</td>
                                                                 <td> $1,909.00</td>
                                                                 <td><span
                                                                           class="badge  bg-success text-light px-2 py-1 fs-13">Paid</span>
                                                                 </td>
                                                                 <td> 6</td>
                                                                 <td> #D-89734235</td>
                                                                 <td> <span
                                                                           class="badge border border-success text-success  px-2 py-1 fs-13">Completed</span>
                                                                 </td>
                                                                 <td>
                                                                      <div class="d-flex gap-2">
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-light btn-sm"><iconify-icon
                                                                                     icon="solar:eye-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-primary btn-sm"><iconify-icon
                                                                                     icon="solar:pen-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                     icon="solar:trash-bin-minimalistic-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                 </td>
                                                            </tr>


                                                            <tr>
                                                                 <td>
                                                                      #930447/80
                                                                 </td>
                                                                 <td>March 28 , 2024</td>
                                                                 <td>
                                                                      <a href="orders-list#!"
                                                                           class="link-primary fw-medium">Alphonse
                                                                           Roy</a>
                                                                 </td>
                                                                 <td> High</td>
                                                                 <td> $879.00</td>
                                                                 <td><span
                                                                           class="badge  bg-success text-light px-2 py-1 fs-13">Paid</span>
                                                                 </td>
                                                                 <td> 4</td>
                                                                 <td> #D-35227268</td>
                                                                 <td><span
                                                                           class="badge border border-success text-success  px-2 py-1 fs-13">Completed</span>
                                                                 </td>
                                                                 <td>
                                                                      <div class="d-flex gap-2">
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-light btn-sm"><iconify-icon
                                                                                     icon="solar:eye-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-primary btn-sm"><iconify-icon
                                                                                     icon="solar:pen-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                     icon="solar:trash-bin-minimalistic-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                 </td>
                                                            </tr>

                                                            <tr>
                                                                 <td>
                                                                      #462397/80
                                                                 </td>
                                                                 <td>March 20 , 2024</td>
                                                                 <td>
                                                                      <a href="orders-list#!"
                                                                           class="link-primary fw-medium">Pierpont
                                                                           Marleau</a>
                                                                 </td>
                                                                 <td> High</td>
                                                                 <td> $1,230.00</td>
                                                                 <td> <span
                                                                           class="badge bg-light text-dark  px-2 py-1 fs-13">Refund</span>
                                                                 </td>
                                                                 <td> 2</td>
                                                                 <td> -</td>
                                                                 <td> <span
                                                                           class="badge border border-danger text-danger  px-2 py-1 fs-13">Canceled</span>
                                                                 </td>
                                                                 <td>
                                                                      <div class="d-flex gap-2">
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-light btn-sm"><iconify-icon
                                                                                     icon="solar:eye-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-primary btn-sm"><iconify-icon
                                                                                     icon="solar:pen-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                     icon="solar:trash-bin-minimalistic-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                 </td>
                                                            </tr>

                                                            <tr>
                                                                 <td>
                                                                      #472356/80
                                                                 </td>
                                                                 <td>March 12 , 2024</td>
                                                                 <td>
                                                                      <a href="orders-list#!"
                                                                           class="link-primary fw-medium">Madeleine
                                                                           Gervais</a>
                                                                 </td>
                                                                 <td> Normal</td>
                                                                 <td> $1,264.00</td>
                                                                 <td> <span
                                                                           class="badge bg-success text-light  px-2 py-1 fs-13">Paid</span>
                                                                 </td>
                                                                 <td> 3</td>
                                                                 <td> #D-74922656</td>
                                                                 <td> <span
                                                                           class="badge border border-success text-success  px-2 py-1 fs-13">Completed</span>
                                                                 </td>
                                                                 <td>
                                                                      <div class="d-flex gap-2">
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-light btn-sm"><iconify-icon
                                                                                     icon="solar:eye-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-primary btn-sm"><iconify-icon
                                                                                     icon="solar:pen-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                     icon="solar:trash-bin-minimalistic-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                 </td>
                                                            </tr>

                                                            <tr>
                                                                 <td>
                                                                      #448226/80
                                                                 </td>
                                                                 <td>March 02 , 2024</td>
                                                                 <td>
                                                                      <a href="orders-list#!"
                                                                           class="link-primary fw-medium">Satordi
                                                                           Gaillou</a>
                                                                 </td>
                                                                 <td> High</td>
                                                                 <td> $1,787.00</td>
                                                                 <td> <span
                                                                           class="badge bg-success text-light  px-2 py-1 fs-13">Paid</span>
                                                                 </td>
                                                                 <td> 4</td>
                                                                 <td> -</td>
                                                                 <td> <span
                                                                           class="badge border border-warning text-warning  px-2 py-1 fs-13">Packaging</span>
                                                                 </td>
                                                                 <td>
                                                                      <div class="d-flex gap-2">
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-light btn-sm"><iconify-icon
                                                                                     icon="solar:eye-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-primary btn-sm"><iconify-icon
                                                                                     icon="solar:pen-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                                                                           <a href="orders-list#!"
                                                                                class="btn btn-soft-danger btn-sm"><iconify-icon
                                                                                     icon="solar:trash-bin-minimalistic-2-broken"
                                                                                     class="align-middle fs-18"><template
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
                    <jsp:include page="/webPage/admin/footer.jsp"></jsp:include>
                    <!-- ========== Footer End ========== -->

               </div>
               <!-- ==================================================== -->
               <!-- End Page Content -->
               <!-- ==================================================== -->


          </div>

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